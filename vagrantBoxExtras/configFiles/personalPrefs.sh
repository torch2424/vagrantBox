#!/usr/bin/env bash

#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/vagrantBoxExtras/configFiles/bashItInput.txt

# Source doesnt work within an sh call, calling within
# the callign script
#source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'

#Add our awesome ubuntu banner
sudo cp /vagrant/vagrantBoxExtras/configFiles/ubuntuBanner/sshd_config /etc/ssh/sshd_config
sudo cp /vagrant/vagrantBoxExtras/configFiles/ubuntuBanner/issue.net /etc/issue.net
sudo cp /vagrant/vagrantBoxExtras/configFiles/ubuntuBanner/issue.net /etc/motd


#Finished!
