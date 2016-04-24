#!/usr/bin/env bash

#Made with help from Digital Ocean Guides
#And my guide: https://github.com/torch2424/Elementary-Ubuntu-Web-Dev-Environment

#Remove Non-interactive .bashrc lines
sed '5,10d;' /home/vagrant/.bashrc > /home/vagrant/.bashrcNew
mv /home/vagrant/.bashrcNew /home/vagrant/.bashrc

#Update The Distro
sudo apt-get update

#Download things for Npm and Ruby(Compass and things)
sudo apt-get install -y git build-essential libssl-dev git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#Install NVM (Node Version Manager)
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
source /home/vagrant/.bashrc

#Install Node (Latest LTS on 4/23/16)
nvm install 4.4.3
nvm use 4.4.3
node -v
nvm alias default 4.4.3

#Install npm without sudo
curl https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | sh < /vagrant/npmNoSudoInput.txt
source /home/vagrant/.bashrc

#Install RBEnv
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source /home/vagrant/.bashrc

#Use RBEnv To install Ruby (Latest on 4/23/16)
rbenv install -v 2.3.0
rbenv global 2.3.0

#ensure it installed
ruby -v

#ruby gem tweaking
echo "gem: --no-document" > ~/.gemrc
gem install bundler

#Install Rails
gem install rails
rbenv rehash
rails -v

#INstall compass
gem install compass
rbenv rehash

#Install Jekyll
gem install jekyll
rbenv rehash

#Install stuff with npm
npm install -g npm
npm install --global yo --unsafe-perm
npm install --global bower grunt-cli ionic express
yo --version
bower --version
grunt --version

#Clone my bash-it and install
git clone --depth=1 https://github.com/torch2424/bash-it.git ~/.bash_it
~/.bash_it/install.sh < /vagrant/bashItInput.txt
source /home/vagrant/.bashrc

#Cache github credentials for 12 hours
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=43200'


#Finished!
