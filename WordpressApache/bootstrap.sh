#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

# Download Lamp stack packages/dev packages
sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt git vim curl

#Download mysql server (non-interactive)
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server php5-mysql
#Set a mysql password
mysqladmin -u root password rootpassword

# Replace apache dir.conf, enable apache php
sudo mv /vagrant/apache/dir.conf /etc/apache2/mods-enabled/dir.conf

#Restart apache
sudo service apache2 restart

#Set our document root so we can access it
mkdir /vagrant/html
sudo mv /vagrant/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

#Restart apache
sudo service apache2 restart

#Allow .htaccess overrieds
sudo mv /vagrant/apache/apache2.conf /etc/apache2/apache2.conf
sudo a2enmod rewrite
sudo apache2ctl configtest
sudo systemctl restart apache2

#Own the html directory by www-data
sudo chown -R vagrant:www-data /vagrant/html
sudo chmod -R 755 /vagrant/html

#Log into mysql to create a wordpress DB
echo "CREATE DATABASE wordpress;" | mysql -u root -prootpassword
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" | mysql -u root -prootpassword
echo "FLUSH PRIVILEGES;" | mysql -u root -prootpassword


#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'


#Finished!
