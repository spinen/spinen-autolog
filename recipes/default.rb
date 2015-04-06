#
# Cookbook Name:: spinen_autolog
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

=begin
This creates a line that by default logs all ssh users **except root** out after 10 minutes with a 
60 second grace period.
It is advisable to disable root login, however it is outside the scope of this cookbook.
To add additional protected users see the vagrant recipe as an example
=end

node['autolog']['protected_users'].each do |protected|
  autolog_line protected do
    options  { :name => protected, :idle => '-1' }
    action :create
  end
end

autolog_line 'everyone' do
  options { :idle => '10', :grace => '60'}
  action :create
end

