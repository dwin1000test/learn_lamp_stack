default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true

default['learn_lamp_stack']['open_ports'] = [80, 443]

default['learn_lamp_stack']['webapp']['user'] = 'webadmin'
default['learn_lamp_stack']['webapp']['group'] = 'webadmin'

default['learn_lamp_stack']['docroot'] = '/var/www/customers/public_html'
default['learn_lamp_stack']['logdir'] = '/var/log/httpd'
default['learn_lamp_stack']['email'] = 'fakeops@notinmyhouse.com'
