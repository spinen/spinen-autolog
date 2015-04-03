#
# Cookbook Name:: @cookbook_name
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#

package 'autolog' do
  action :install
end

service 'autolog' do
  supports :restart => true
end

template '/etc/autolog.conf' do
  source 'autolog.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[autolog]'
end
