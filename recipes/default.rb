#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Cookbook Name:: jumper
# Recipe:: default
#
# Copyright (C) 2014 Bloomberg Finance L.P.
#
node.tag('jumper.gateway')

include_recipe 'chef-provisioning::default'
include_recipe 'chef-vault::default'

include_recipe 'python::default'
include_recipe 'python::pip'
include_recipe 'python::virtualenv'
python_pip 'python-ldap'

# The gateway machines should update on a quicker interval.
node.override['chef_client']['config']['interval'] = 300
node.override['chef_client']['config']['splay'] = nil
include_recipe 'chef-client::config'
include_recipe 'chef-client::default'

# TODO: (jbellone) An enhancement would be to permit forward agent so
# that several private keys could be dropped on the gateway. But for
# now we do not permit forward agent since there is only a single
# private key.
node.default['openssh']['client']['forward_agent'] = 'no'
node.default['openssh']['server']['permit_root_login'] = 'no'
include_recipe 'openssh::default'
include_recipe 'openssh::iptables'

# Authentication credentials for LDAP are stored in a secure item.
# These are necessary for querying the directory service for public
# keys when users initially connect.
ldap = chef_vault_item(node['vault']['bag_name'], 'ldap')[node.chef_environment]
node.default['openldap']['auth_binddn'] = ldap['auth_binddn']
node.default['openldap']['auth_bindpw'] = ldap['auth_bindpw']
include_recipe 'openldap::auth'
include_recipe 'openssh-lpk::default'

# Distribute the private keys using secure data bags. Only the nodes
# and administrators are able to decrypt these. It may make sense here
# to use a search query instead of a single bag item.
item = chef_vault_item(node['vault']['bag_name'], 'jumper')[node.chef_environment]
item['users'].each do |u|
  r = directory File.join(node['jumper']['home_path'], u['name'], '.ssh') do
    recursive true
    owner 'root'
    group 'root'
    mode '0600'
    not_if { Dir.exist?(path) }
  end

  Chef::Log.debug "Writing '#{u['name']}' private key to '#{r.path}'"
  private_key File.join(r.path, 'id_rsa') do
    source_key OpenSSL::PKey::RSA.new(u['private_key'].gsub(/\\n?/, "\n"))
    public_key_path File.join(r.path, 'id_rsa.pub')
    not_if { File.exist?(File.join(r.path, 'id_rsa')) }
    only_if { u['private_key'] }
  end
end
