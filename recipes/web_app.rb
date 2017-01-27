#
# Cookbook:: learn_lamp_stack
# Recipe:: web_app
#
# Copyright:: 2017, The Authors, All Rights Reserved.

httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
  action :create
end

# Create the document root directory.
#directory node['learn_lamp_stack']['docroot'] do
directory '/var/www/customers/public_html' do
  recursive true
end

# Write the home page.
file '/var/www/customers/public_html/index.html' do
  content '<html>This is a placeholder</html>'
  mode '0644'
  owner node['learn_lamp_stack']['webapp']['user']
  group node['learn_lamp_stack']['webapp']['group']
end
