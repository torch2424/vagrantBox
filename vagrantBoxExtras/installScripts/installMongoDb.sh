#!/bin/bash

# Install script for MongoDB on Ubuntu 16.04
# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update

sudo apt-get install -y mongodb-org
sudo cp /vagrant/vagrantBoxExtras/configFiles/mongodb.service /etc/systemd/system/mongodb.service

sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb

echo "MongoDb Successfully installed!"
