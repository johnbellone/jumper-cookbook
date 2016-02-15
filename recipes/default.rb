#
# Cookbook: jumper
# License: Apache 2.0
#
# Copyright 2014-2016, Bloomberg Finance L.P.
#

node.default['chef_client']['splay'] = 300
node.default['chef_client']['init_style'] = 'none'
node.default['chef_client']['cron']['minute'] = '*/15'
node.default['chef_client']['cron']['hour'] = '*'
node.default['chef_client']['config']['client_fork'] = false
include_recipe 'chef-client::config', 'chef-client::cron', 'chef-client::delete_validation'

node.default['ssh']['use_pam'] = true
node.default['ssh']['print_motd'] = true
node.default['ssh']['print_last_log'] = true
node.default['ssh']['allow_ssh_agent_forwarding'] = true
node.default['ssh']['allow_tcp_forwarding'] = true
node.default['ssh']['allow_x11_forwarding'] = false
include_recipe 'ssh-hardening::default'

node.default['auth']['pw_max_age'] = -1
node.default['auth']['pw_min_age'] = -1
node.default['auth']['pam']['passwdqc']['enable'] = false
include_recipe 'os-hardening::default'

node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['include_sudoers_d'] = true
node.default['authorization']['sudo']['groups'] = %w{sudo}
include_recipe 'sudo::default'
