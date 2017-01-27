require 'spec_helper'

#describe command('getent passwd node['learn_lamp_stack']['user'] ) do
describe command('getent passwd webadmin' ) do
    its(:stdout) { should match /webadmin/ }
end

