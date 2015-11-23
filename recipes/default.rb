#
# Cookbook: jumper
# License: Apache 2.0
#
# Copyright 2014-2015, Bloomberg Finance L.P.
#

node.default['ssh-hardening']['allow_ssh_agent_forwarding'] = true
node.default['ssh-hardening']['allow_tcp_forwarding'] = true
node.default['ssh-hardening']['allow_x11_forwarding'] = false
include_recipe 'ssh-hardening::default', 'os-hardening::default'
