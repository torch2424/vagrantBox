#!/usr/bin/env bash

#Remove Non-interactive .bashrc lines
sh /vagrant/BaseVagrant/interactiveBash.sh

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

#Add my personal preferences
sh /vagrant/BaseVagrant/personalPrefs.sh

#Finished!
