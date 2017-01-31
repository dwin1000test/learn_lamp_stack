#
# Cookbook:: learn_lamp_stack
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_lamp_stack::web_app' do
  context 'When all attributes are default, on an unspecified platform' do
    #before do
    #  #Fauxhai.mock(platform:'centos', version:'7.2.1511') 
    #  Fauxhai.mock(platform:'rhel', version:'5.11') 
    #end

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    before do
      allow(Chef::Platform::ServiceHelpers).to receive(:service_resource_providers).and_return(
      [:redhat]
    )
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'create directory[/var/www/customers/public_html]' do
      expect(chef_run).to create_directory('/var/www/customers/public_html')
        .with(
          recursive: true
        )
    end

    it 'create template[/var/www/customers/public_html/index.php]' do
      expect(chef_run).to create_template('/var/www/customers/public_html/index.php')
        .with(
          owner: 'webadmin',
          group: 'webadmin',
          source: 'index.php.erb',
          mode: '0644'
        )
    end

    it 'installs package[php-mysql]' do
      expect(chef_run).to install_package('php-mysql')
        .with(
          package_name: 'php-mysql'
        )
    end 

    it 'creates httpd_module[php]' do
      expect(chef_run).to create_httpd_module('php')
    end

    it 'creates template[/etc/httpd-customers/conf.d/customers.conf]' do
      expect(chef_run).to create_httpd_config('customers')
        .with(
          source: 'customers.conf.erb'
        )
    end

  end
end
