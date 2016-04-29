#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

#Download things for Npm and Ruby(Compass and things)
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip git git-core curl vim

#Update pip
sudo pip install --upgrade pip

#Get Python ssl working
sudo -H pip install -U pyopenssl ndg-httpsclient pyasn1

#Install scipy (And Numpy)
sudo -H pip install -U scipy

#Echo scipy install (To create a newline, because pip doesn't)
echo "Vagrant Bootstrap: Scipy was installed!"

#Install libraries with pip
sudo -H pip install -U nltk textblob scikit-learn

#Echo txtblob install, bootstrap does not
echo "Vagrant Bootstrap: Currently downloading textblob/nltk data, please wait..."

#textblob nltk library
python -m textblob.download_corpora

#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'


#Finished!
