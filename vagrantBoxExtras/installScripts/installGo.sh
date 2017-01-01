#!/usr/bin/env bash

# Install packages for chipGo (OpenGL, Glew)
sudo apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev libglew-dev libglfw-dev xorg-dev libglu1-mesa-dev

# Need to install glfw3 by source (for chipGo)
# wget https://github.com/glfw/glfw/releases/download/3.2/glfw-3.2.zip
# sudo unzip glfw-3.2.zip
# cd glfw-3.2
# sudo cmake .
# sudo make
# sudo make install
# cd ..
#Clean up
# sudo rm glfw-3.2.zip
# sudo rm -rf glfw-3.2

#Install Go 1.7.4
#Installing from source and not GVM as it has a bunch of issues
GO_VERSION=1.7.4

echo 'Downloading go$GO_VERSION.linux-amd64.tar.gz'
curl -O https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
echo 'Unpacking go language'
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
sudo chown -R root:root /usr/local/go
#Cleanup
sudo rm go$GO_VERSION.linux-amd64.tar.gz

#Editing .bashrc
echo 'Setting up correct env. variables'
echo 'export GOROOT=/usr/local/go' >> /home/$(whoami)/.bashrc
echo 'export GOPATH=/home/$(whoami)/goPath' >> /home/$(whoami)/.bashrc
echo 'export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"' >> /home/$(whoami)/.bashrc
source /home/$(whoami)/.bashrc

#Create reuired go folders
mkdir -p $GOPATH/{bin,pkg,src}
