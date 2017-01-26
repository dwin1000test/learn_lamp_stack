require 'spec_helper'
#require 'firewalld'

if os[:family] == 'redhat'
    describe service('firewalld') do
        it { should be_enabled }
        it { should be_running }
    end

#    describe firewalld do
#        it { should have_port('80/tcp') }
#    end
end


