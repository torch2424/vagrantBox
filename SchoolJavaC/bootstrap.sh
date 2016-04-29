#!/usr/bin/env bash

#Remove Non-interactive .bashrc lines
sh /vagrant/BaseVagrant/interactiveBash.sh

#Update The Distro
sudo apt-get update

#Install some packages
sudo apt-get install -y build-essential git git-core curl vim openjdk-7-jdk eclipse eclipse-cdt g++

#Add my personal preferences
sh /vagrant/BaseVagrant/personalPrefs.sh
source /home/vagrant/.bashrc


#Finished!
