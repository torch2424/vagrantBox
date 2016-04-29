#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-14-04
#https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-14-04

#And my repo
#https://github.com/torch2424/Team-No-Comply-Games-Wordpress

#Remove Non-interactive .bashrc lines
sh /vagrant/BaseVagrant/interactiveBash.sh

#Update The Distro
sudo apt-get update

# Download Lamp stack packages/dev packages
sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt git vim curl

#Download mysql server and phpmyadmin (non-interactive)
#From: https://gist.github.com/rrosiek/8190550
echo "mysql-server mysql-server/root_password password rootpassword" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | sudo debconf-set-selections
sudo apt-get -y install mysql-server php5-mysql phpmyadmin

# Set Up our apache
sh /vagrant/BaseVagrant/apacheVagrant.sh

#Log into mysql to create a wordpress DB
echo "CREATE DATABASE wordpress;" | mysql -u root -prootpassword
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" | mysql -u root -prootpassword
echo "FLUSH PRIVILEGES;" | mysql -u root -prootpassword

#Add my personal preferences
sh /vagrant/BaseVagrant/personalPrefs.sh

#Lastly, remind users to import a wp-config for wordpress
echo "****************************************************"
echo "FINISHED!"
echo "Friendly Reminder: Don't forget to set your keys and"
echo "things for wordpress repos and stuff!"
echo "e.g. wp-config.php, keys.json, etc..."
echo " "
echo "Clone your repos into /vagrant/html"
echo "And go to localhost:8080/repofoldernamehere"
echo "And test by simply going to localhost:8080"
echo "****************************************************"

#Finished!
