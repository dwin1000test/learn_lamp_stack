#
# Cookbook:: learn_lamp_stack
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'yum-mysql-community::mysql57'

mysql_client 'default' do
  action :create
end

#Configure the MySQL service
mysql_service 'default' do
  version '5.7'
  initial_root_password node['learn_lamp_stack']['database']['rootpw']
  action [:create, :start]
  provider Chef::Provider::MysqlServiceSystemd
end

# Add mysql Gem
mysql2_chef_gem 'default' do
  action :install
end

# Create a database instance
mysql_database node['learn_lamp_stack']['database']['dbname'] do
  connection(
    :host => node['learn_lamp_stack']['database']['host'],
    :username => node['learn_lamp_stack']['database']['root_username'],
    :password => node['learn_lamp_stack']['database']['rootpw']
  )
  action :create
end

# Add a database user
mysql_database_user node['learn_lamp_stack']['database']['admin_username'] do
  connection(
    :host => node['learn_lamp_stack']['database']['host'],
    :username => node['learn_lamp_stack']['database']['root_username'],
    :password => node['learn_lamp_stack']['database']['rootpw']
  )
  password node['learn_lamp_stack']['database']['adminpw']
  database_name node['learn_lamp_stack']['database']['dbname']
  host node['learn_lamp_stack']['database']['host']
  action [:create, :grant]
end

# Create a path to the SQL file in the Chef cache.
create_tables_script_path = File.join(Chef::Config[:file_cache_path], 'create-tables.sql')

# Write the SQL script to the filesystem.
cookbook_file create_tables_script_path do
  source 'create-tables.sql'
  owner 'root'
  group 'root'
  mode '0600'
end

# Seed the database with a table and test data.
execute "initialize #{node['learn_lamp_stack']['database']['dbname']} database" do
  command "mysql -h #{node['learn_lamp_stack']['database']['host']} -u #{node['learn_lamp_stack']['database']['admin_username']} -p#{node['learn_lamp_stack']['database']['adminpw']} -D #{node['learn_lamp_stack']['database']['dbname']} < #{create_tables_script_path}"
  not_if  "mysql -h #{node['learn_lamp_stack']['database']['host']} -u #{node['learn_lamp_stack']['database']['admin_username']} -p#{node['learn_lamp_stack']['database']['adminpw']} -D #{node['learn_lamp_stack']['database']['dbname']} -e 'describe customers;'"
end

