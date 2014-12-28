include_recipe 'chef-vault::default'
include_recipe 'openssh::default'
include_recipe 'ldap::default'

node.default['openldap']['server'] = 'localhost'
node.default['openldap']['rootpw'] = '{SSHA}PS66Z0zMBoRma2VenAu5soOuW18pft3z'
node.default['openldap']['tls_enabled'] = false
include_recipe 'openldap::server'

ldap = chef_vault_item('secrets', 'ldap')[node.chef_environment]
ldap_entry 'ou=people,dc=localdomain' do
  credentials bind_dn: ldap['auth_binddn'], password: ldap['auth_bindpw']
  attributes(objectClass: ['top', 'organizationalUnit'],
             ou: 'people',
             description: 'The people in this organization.')
end

ldap_entry 'ou=groups,dc=localdomain' do
  credentials bind_dn: ldap['auth_binddn'], password: ldap['auth_bindpw']
  attributes(objectClass: ['top', 'organizationalUnit'],
             ou: 'groups',
             description: 'The groups in this organization.')
end

ldap_user 'jbellone' do
  credentials bind_dn: ldap['auth_binddn'], password: ldap['auth_bindpw']
  basedn 'ou=people,dc=localdomain'
  home '/home/jbellone'
  shell '/bin/bash'
  password 'secretsauce'
end
