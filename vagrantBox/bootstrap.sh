#!/usr/bin/env bash

#Welcome the user
echo "Welcome to the Torch2424 Ubuntu Vagrant box!"
echo ""
echo "Initializing the box for configuration..."
echo ""

# Remove Non-interactive .bashrc lines
echo "Modifying .bashrc to allow edits"
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

# Make the source folder
sudo mkdir /vagrant/source

# Update The Distro
sudo apt-get update

# Download common dev packages
sudo apt-get install -y git git-core vim curl build-essential wget unzip make cmake

# Audio Forwarding
# Ensure you follow this for your host machine: http://superuser.com/questions/231920/forwarding-audio-like-x-in-ssh
#And try restarting pulse audio: http://askubuntu.com/questions/15223/how-can-i-restart-pulseaudio-without-logout
wget https://code.launchpad.net/~ubuntu-audio-dev/+archive/ubuntu/alsa-daily/+files/oem-audio-hda-daily-dkms_0.201607270501~ubuntu14.04.1_all.deb
sudo dpkg -i oem-audio-hda-daily-dkms_0.201607270501~ubuntu14.04.1_all.deb
rm oem-audio-hda-daily-dkms_0.201607270501~ubuntu14.04.1_all.deb
sudo apt-get -y install alsa-utils paman
sudo cp /vagrant/vagrantBoxExtras/configFiles/.asoundrc /home/vagrant/.asoundrc
sudo usermod -a -G audio vagrant

# Allow the appropriate scripts to be executed
chmod +x /vagrant/vagrantBoxExtras/vagrantDevSetup.sh
chmod +x /vagrant/vagrantBoxExtras/installScripts/*.sh

# Inform user done provisioning, and can run enviornment set up scripts

echo ""
echo "Your box has now finished provisioning! This box also has scripts for instlaling multiple development environemnts. SSH into your new vagrant box using 'vagrant ssh', and then you can run the dev enviornment setup scripts by running './vagrant/vagrantBoxExtras/vagrantDevSetup.sh'. Have a nice day!"
echo ""
