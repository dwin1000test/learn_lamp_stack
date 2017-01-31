# learn_lamp_stack 1
Cook book to install a LAMP stack

TODO:
Create a CI server
Separate database cookbook from web onto different VMs: ubuntu for webapp, rhel for db
Learn to run test kitchen against ec2 instead of vagrant
Apply to each AWS Ubuntu node
Refactor cookbook to include Ubuntu 1604
Refactor cookbook to include Ubuntu 1404
- Fix index.php to include template file instead
- Apply to AWS node
- Write Serverspec tests for firewalld
Write Chefspec tests to check certain recipe was included
- Write InSpec tests
-Install Mysql on CentOS 7
.Install Apache on CentOS 7
- Create knowledge base of current known commands
- upload Berks dependencies of selinux and firewall
- Write ChefSpec and Inspec for SELinux: permissive line
     ChefSpec NOTE: Pass on this for now
     - InSpec
- Edit the metadata.rb file to customize to the project
