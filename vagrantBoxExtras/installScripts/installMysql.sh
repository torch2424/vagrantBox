#!/usr/bin/env bash

# Download mysql server and phpmyadmin (non-interactive)
# From: https://gist.github.com/rrosiek/8190550
echo "mysql-server mysql-server/root_password password rootpassword" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password rootpassword" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | sudo debconf-set-selections

#Since we have set our selections, now install mysql
sudo apt-get -y install mysql-server php5-mysql phpmyadmin

#Log into mysql to create a vagrant mysql DB
echo "CREATE DATABASE vagrant;" | mysql -u root -prootpassword
echo "GRANT ALL ON vagrant.* TO 'vagrantuser'@'localhost' IDENTIFIED BY 'password';" | mysql -u root -prootpassword
echo "FLUSH PRIVILEGES;" | mysql -u root -prootpassword

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
