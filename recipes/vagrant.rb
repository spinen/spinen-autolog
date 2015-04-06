#
# Cookbook Name:: spinen_autolog
# Recipe:: vagrant
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#
node.default['autolog']['protected_users'] = node['autolog']['protected_users'] + ['vagrant']

include_recipe 'default'
