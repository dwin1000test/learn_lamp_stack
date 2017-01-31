#
# Cookbook:: learn_lamp_stack
# Recipe:: firewall
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'firewall::default'

#ports = node['learn_lamp_stack']['firewalld']['open_ports']
fw = node['learn_lamp_stack']['firewalld']
ports = fw['open_ports']
firewall_rule "open ports #{ports}" do
    port ports
end

firewall 'default' do
    action :save
end

