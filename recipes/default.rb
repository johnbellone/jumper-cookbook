#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Cookbook Name:: jumper
# Recipe:: default
#
# Copyright (C) 2014 Bloomberg Finance L.P.
#
include_recipe 'chef-sugar::default'
include_recipe 'chef-vault::default'
include_recipe 'openldap::auth'
include_recipe 'openssh::lpk'
