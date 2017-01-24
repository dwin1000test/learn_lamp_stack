# # encoding: utf-8

# Inspec test for recipe learn_lamp_stack::default

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

describe file('/etc/selinux/config') do
  its('content') { should match /^SELINUX=permissive$/ }
end
