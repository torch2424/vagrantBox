#!/usr/bin/env bash

# Replace apache dir.conf, enable apache php
sudo cp /vagrant/BaseApache/dir.conf /etc/apache2/mods-enabled/dir.conf

#Restart apache
sudo service apache2 restart

#Set our document root so we can access it
sudo cp /vagrant/BaseApache/000-default.conf /etc/apache2/sites-available/000-default.conf

#Restart apache
sudo service apache2 restart

#Allow .htaccess overrides
sudo cp /vagrant/BaseApache/apache2.conf /etc/apache2/apache2.conf
sudo a2enmod rewrite
sudo apache2ctl configtest
sudo systemctl restart apache2

#Own the html directory by www-data
sudo chown -R vagrant:www-data /vagrant/html
sudo chmod -R 755 /vagrant/html

#Restart apache for the permissions change
sudo service apache2 restart
