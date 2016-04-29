#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
echo "Modifying .bashrc to allow edits"
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

#Install some packages
sudo apt-get install -y build-essential git git-core curl vim openjdk-7-jdk eclipse eclipse-cdt g++

#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'

#Add our awesome ubuntu banner
sudo cp /vagrant/UbuntuBanner/sshd_config /etc/ssh/sshd_config
sudo cp /vagrant/UbuntuBanner/issue.net /etc/issue.net
sudo cp /vagrant/UbuntuBanner/issue.net /etc/motd


#Finished!
