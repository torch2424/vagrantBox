#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

# Download Lamp stack packages
sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt

#Download mysql server (non-interactive)
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server php5-mysql
#Set a mysql password
mysqladmin -u root password rootpassword

#Log into mysql to create a wordpress DB
echo "CREATE DATABASE wordpress;" | mysql -u root -p rootpassword
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" | mysql -u root -p rootpassword
echo "FLUSH PRIVILEGES;" | mysql -u root -p rootpassword


#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'


#Finished!
