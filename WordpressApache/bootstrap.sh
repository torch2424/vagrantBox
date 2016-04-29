#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
echo "Modifying .bashrc to allow edits"
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

# Download Lamp stack packages/dev packages
sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt git vim curl

#Download mysql server and phpmyadmin (non-interactive)
#From: https://gist.github.com/rrosiek/8190550
echo "mysql-server mysql-server/root_password password rootpassword" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rootpassword" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password rootpassword" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password rootpassword" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password rootpassword" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
sudo apt-get -y install mysql-server php5-mysql phpmyadmin

# Replace apache dir.conf, enable apache php
sudo cp /vagrant/apache/dir.conf /etc/apache2/mods-enabled/dir.conf

#Restart apache
sudo service apache2 restart

#Set our document root so we can access it
mkdir /vagrant/html
sudo cp /vagrant/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

#Restart apache
sudo service apache2 restart

#Allow .htaccess overrieds
sudo cp /vagrant/apache/apache2.conf /etc/apache2/apache2.conf
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
