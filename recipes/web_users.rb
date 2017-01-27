#
# Cookbook:: learn_lamp_stack
# Recipe:: web_users
#
# Copyright:: 2017, The Authors, All Rights Reserved.
group node['learn_lamp_stack']['webapp']['group']

user node['learn_lamp_stack']['webapp']['group'] do
    group node['learn_lamp_stack']['webapp']['group']
    system true
    shell '/bin/bash'
end
