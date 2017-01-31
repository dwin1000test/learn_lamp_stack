#
# Cookbook:: learn_lamp_stack
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_lamp_stack::database' do
  context 'When all attributes are set, on CentOS 7.2.1511' do
    before do
      stub_command("mysql -h fake_host -u fake_admin -pfake_admin_password -D fake_database -e 'describe customers;'").and_return(false)
    end

    let(:connection_info) do
      { host: 'fake_host', username: 'fake_root', password: 'fake_root_password' }
    end

    let(:create_tables_script_path) { File.join(Chef::Config[:file_cache_path], 'create-tables.sql') }

    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511') do |node|
        node.override['learn_lamp_stack']['database']['rootpw'] = 'fake_root_password'
        node.override['learn_lamp_stack']['database']['adminpw'] = 'fake_admin_password'
        node.override['learn_lamp_stack']['database']['dbname'] = 'fake_database'
        node.override['learn_lamp_stack']['database']['host'] = 'fake_host'
        node.override['learn_lamp_stack']['database']['root_username'] = 'fake_root'
        node.override['learn_lamp_stack']['database']['admin_username'] = 'fake_admin'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # from mysql matcher libraries
    it 'sets the MySQL service root password'  do
      expect(chef_run).to create_mysql_service('default')
        .with(initial_root_password: 'fake_root_password')
    end

    # from mysql matcher libraries
    it 'creates the database instance' do
      expect(chef_run).to create_mysql_database('fake_database')
        .with(connection: connection_info)
    end

    # from database matcher libraries
    it 'creates the database user' do
      expect(chef_run).to create_mysql_database_user('fake_admin')
        .with(connection: connection_info, password: 'fake_admin_password', database_name: 'fake_database', host: 'fake_host')
    end

    # Use this when running shell commands
    it 'seeds the database with a table and test data' do
      expect(chef_run).to run_execute('initialize fake_database database')
        .with(command: "mysql -h fake_host -u fake_admin -pfake_admin_password -D fake_database < #{create_tables_script_path}")
    end
  end
end

