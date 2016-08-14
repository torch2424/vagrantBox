#!/usr/bin/env bash

#Install packages for chipGo (OpenGL, Glew)
sudo apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev libglew-dev libglfw-dev xorg-dev libglu1-mesa-dev

# Need to install glfw3 by source
wget https://github.com/glfw/glfw/releases/download/3.2/glfw-3.2.zip
sudo unzip glfw-3.2.zip
cd glfw-3.2
sudo cmake .
sudo make
sudo make install
cd ..

#Install Go 1.5
#Installing from source and not GVM as it has a bunch of issues
GO_VERSION=1.5

echo 'Downloading go$GO_VERSION.linux-amd64.tar.gz'
curl -O https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
echo 'Unpacking go language'
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
sudo chown -R root:root /usr/local/go

#Editing .bashrc
echo 'Setting up correct env. variables'
echo 'export GOROOT=/usr/local/go' >> /home/vagrant/.bashrc
echo 'export GOPATH=/vagrant/goPath' >> /home/vagrant/.bashrc
echo 'export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

#Test go with a hello world
mkdir -p /vagrant/goPath/{bin,pkg,src}
mkdir -p /vagrant/goPath/src/helloworld
cp /vagrant/vagrantBoxExtras/configFiles/helloworld.go /vagrant/goPath/src/helloworld
go install helloworld
helloworld
