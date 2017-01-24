#
# Cookbook:: learn_lamp_stack
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'selinux::permissive'
include_recipe 'learn_lamp_stack::firewall'
