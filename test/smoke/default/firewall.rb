# # encoding: utf-8

# Inspec test for recipe learn_lamp_stack::firewall

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end


if os[:family] == 'debian'
    skip 'This is a placeholder'
elsif os[:family] == 'rhel'
    describe package 'firewalld' do
        it { should be_installed }
    end
    describe service 'firewalld' do
        it { should be_enabled }
        it { should be_running }
    end
end

