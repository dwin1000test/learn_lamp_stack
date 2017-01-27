describe command("curl -L localhost") do
    its(:stdout) { should match /placeholder/ }
end

describe file('/etc/httpd-customers/conf.d/customers.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
end

describe command("service httpd-customers status") do
    its(:stdout) { should match /active \(running\)/ }
end
