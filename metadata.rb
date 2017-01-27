name 'learn_lamp_stack'
maintainer 'Darren Nguyen'
maintainer_email 'nextlevelfake@gmail.com'
license 'all_rights'
description 'Installs/Configures learn_lamp_stack'
long_description 'Installs/Configures learn_lamp_stack'
version '0.4.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/learn_lamp_stack/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/learn_lamp_stack' if respond_to?(:source_url)
depends 'selinux', '~> 0.9'
depends 'firewall', '~> 2.5'

#depends 'apache2', '~> 3.2' 
depends 'httpd', '~> 0.4.4' 
depends 'yum-mysql-community', '~> 2.0'
depends 'mysql', '~> 7.2.0' 
depends 'mysql2_chef_gem', '~> 1.1'
depends 'database', '~> 6.0'
