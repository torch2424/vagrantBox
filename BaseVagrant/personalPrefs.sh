#!/usr/bin/env bash

#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/BaseVagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'

#Add our awesome ubuntu banner
sudo cp /vagrant/BaseVagrant/UbuntuBanner/sshd_config /etc/ssh/sshd_config
sudo cp /vagrant/BaseVagrant/UbuntuBanner/issue.net /etc/issue.net
sudo cp /vagrant/BaseVagrant/UbuntuBanner/issue.net /etc/motd


#Finished!
