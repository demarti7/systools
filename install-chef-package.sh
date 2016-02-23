# CHEF Server & Chef Development Kit Install script

#!/bin/bash
sudo su

# Install Chef Server #
wget "https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.1.0-1_amd64.deb"
chmod +x chef-server-core_12.1.0-1_amd64.deb
sudo dpkg -i chef-server-core_12.1.0-1_amd64.deb
sudo chef-server-ctl reconfigure

# Install Chef Development Kit #
wget "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.2-1_amd64.deb"
chmod +x chefdk_0.6.2-1_amd64.deb
sudo dpkg -i chefdk_0.6.2-1_amd64.deb

# Install GIT #
apt-get install git
git clone git://github.com/opscode/chef-repo.git
sudo apt-get install ruby
sudo gem install net-ssh-multi fog highline

# Create initial .rb file for testing #
touch hello.rb
echo "file 'motd' do" >> hello.rb
echo "content 'hello world'" >> hello.rb
echo "end" >> hello.rb
chef-apply hello.rb
echo "So far so good...."

# Package installs #
sudo apt-get install tree

#to be continued...
