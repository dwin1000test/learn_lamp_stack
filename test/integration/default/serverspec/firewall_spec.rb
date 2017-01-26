require 'spec_helper'

#expected_rules = [
#    %r{ipv4 filter INPUT 50 -p tcp -m multiport --dports 22 -m comment --comment 'all world to ssh' -j ACCEPT},
#    %r{ipv4 filter INPUT 50 -m state --state RELATED,ESTABLISHED -m comment --comment established -j ACCEPT},
#    %r{ipv4 filter INPUT 50 -p tcp -m tcp -m multiport --dports 443,80 -m comment --comment 'open ports [80, 443]' -j ACCEPT},
#
#    %r{ipv6 filter INPUT 50 -m state --state RELATED,ESTABLISHED -m comment --comment established -j ACCEPT},
#    %r{ipv6 filter INPUT 50 -p ipv6-icmp -m comment --comment ipv6_icmp -j ACCEPT},
#    %r{ipv6 filter INPUT 50 -p tcp -m tcp -m multiport --dports 443,80 -m comment --comment 'open ports [80, 443]' -j ACCEPT}
#    ]

#describe command('firewall-cmd --permanent --direct --get-all-rules') do
#    expected_rules.each do |r|
#        its(:stdout) { should match(r) }
#    end
#end

describe service('firewalld') do
    it { should be_running }
    it { should be_enabled }
end
