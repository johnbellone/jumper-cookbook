#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Cookbook Name:: jumper
# Recipe:: gateway
#
# Copyright (C) 2014 Bloomberg Finance L.P.
#
node.default['openssh']['client']['forward_agent'] = 'yes'
node.default['openssh']['server']['permit_root_login'] = 'no'

include_recipe 'openssh::default'
include_recipe 'openssh::server'
