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

=begin
This creates a line that by default logs all ssh users **except root** out after 10 minutes with a
60 second grace period.
It is advisable to disable root login, however it is outside the scope of this cookbook.
To add additional protected users see the vagrant recipe as an example
=end

node['autolog']['protected_users'].each do |protected_user|
  protected_switches = {:name => "#{protected_user}", :idle => '-1' }
  autolog_line protected_user do
    switches protected_switches
    action :create
  end
end

everyone_switches = { :idle => '10', :grace => '60'}

autolog_line 'everyone' do
  switches everyone_switches
  action :create
end

