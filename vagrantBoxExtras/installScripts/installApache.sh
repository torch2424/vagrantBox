#!/usr/bin/env bash

# Download Lamp stack packages/dev packages
sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt

# Replace apache dir.conf, enable apache php
sudo cp /vagrant/vagrantBoxExtras/configFiles/apache/dir.conf /etc/apache2/mods-enabled/dir.conf

#Restart apache
sudo service apache2 restart

#Set our document root so we can access it
sudo cp /vagrant/vagrantBoxExtras/configFiles/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

#Restart apache
sudo service apache2 restart

#Allow .htaccess overrides
sudo cp /vagrant/vagrantBoxExtras/configFiles/apache/apache2.conf /etc/apache2/apache2.conf
sudo a2enmod rewrite
sudo apache2ctl configtest
sudo systemctl restart apache2

# Create an html directory with some base files to visit
sudo mkdir /vagrant/html

sudo cp /vagrant/vagrantBoxExtras/configFiles/apache/index.html /vagrant/html

sudo cp /vagrant/vagrantBoxExtras/configFiles/apache/index.php /vagrant/html

#Own the html directory by www-data
sudo chown -R vagrant:www-data /vagrant/html
sudo chmod -R 755 /vagrant/html

#Restart apache for the permissions change
sudo service apache2 restart
