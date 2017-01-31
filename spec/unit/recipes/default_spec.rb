#
# Cookbook:: learn_lamp_stack
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_lamp_stack::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511').converge(described_recipe)
    end

    it 'include recipe selinux::permissive' do
      expect(chef_run).to include_recipe('selinux::permissive')
    end

    it 'converges successfully' do
      expect(chef_run).to_not raise_error
    end
  end
end
