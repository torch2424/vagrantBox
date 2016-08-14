#!/usr/bin/env bash

#Download things for Npm
sudo apt-get install -y libssl-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#Install NVM (Node Version Manager)
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
. /home/vagrant/.bashrc

#Install Node (Latest LTS on 4/23/16)
nvm install 4.4.3
nvm use 4.4.3
node -v
nvm alias default 4.4.3

#Install npm without sudo
curl https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | sh < /vagrant/vagrantBoxExtras/configFiles/npmNoSudoInput.txt
. /home/vagrant/.bashrc

# Update npm
npm install -g npm

# install yeoman, bower, grunt, ionic, and express
npm install --global yo --unsafe-perm
npm install --global bower grunt-cli ionic express
yo --version
bower --version
grunt --version
