def random_password
    require 'securerandom'
    SecureRandom.base64
end


default['selinux']['state'] = 'disable'

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true

default['learn_lamp_stack']['firewalld']['open_ports'] = [80, 443, 3306]

default['learn_lamp_stack']['webapp']['user'] = 'webadmin'
default['learn_lamp_stack']['webapp']['group'] = 'webadmin'

default['learn_lamp_stack']['webapp']['docroot'] = '/var/www/customers/public_html'
default['learn_lamp_stack']['webapp']['logdir'] = '/var/log/httpd'
default['learn_lamp_stack']['webapp']['email'] = 'fakeops@notinmyhouse.com'


normal_unless['learn_lamp_stack']['database']['rootpw']  = random_password
normal_unless['learn_lamp_stack']['database']['adminpw']  = random_password

default['learn_lamp_stack']['database']['dbname'] = 'my_company'
default['learn_lamp_stack']['database']['host'] = '127.0.0.1'
default['learn_lamp_stack']['database']['root_username'] = 'root'
default['learn_lamp_stack']['database']['admin_username'] = 'db_admin'

