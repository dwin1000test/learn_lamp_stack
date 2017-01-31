#
# Cookbook:: learn_lamp_stack
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_lamp_stack::firewall' do
  context 'When all attributes are default, on an unspecified platform' do
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

    it "adds service http" do
      expect(chef_run).to create_firewall_rule("80")
    end
  end
end
