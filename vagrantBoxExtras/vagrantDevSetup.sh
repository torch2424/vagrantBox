#!/usr/bin/env bash

# Interactive environment script to install environments on vagrant setup

# Asking in the following order: Apache, Mysql, Eclipse, Npm, Ruby, Python, Go, Personal Preferences

echo ""
echo "Now, we shall be provisioning your box with common dev environments. Don't be afraid to say no to any of these, as they can be run anytime by entering 'sh vagrant/vagrantBoxExtras/installScripts/YOUR_DESIRED_INSTALL'."
echo ""

# Ask for Apache
while true; do
    echo "Would you like to install Apache and PHP? This will allow for you to access the server on your host machines port 8080 (localhost:8080), and you can navigate to repos using the directory structure. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installApache.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Mysql
while true; do
    echo "Would you like to install Mysql and Phpmyadmin? This is helpful for developing for wordpress, or any application using a mysql backend. Also, phpmyadmin will allow you to easily manage the sql database. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installMysql.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Eclipse (Java/C++)
while true; do
    echo "Would you like to install Eclipse, Java, and support for C++? This is mostly helpful for developing for school projects. But it will also include helpful tools like openjdk and g++. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installEclipse.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Npm
while true; do
    echo "Would you like to install NodeJs? This will enable developing backends in frameworks like Express, or SPAs in AngularJS. It will also allow support for npm. Version management is done by NVM (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installNpm.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Ruby
while true; do
    echo "Would you like to install Ruby? This will enable developing in Sass, and Jekyll. It will also allow support for rubygems. Version management is done by RVM. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installRuby.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Python
while true; do
    echo "Would you like to install Python? This is mostly geared towards scikit learn, and Machine learning at the moment. However, this will enable developing backends in frameworks like Django. It will also allow support for pip. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installPip.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Go
while true; do
    echo "Would you like to install Go? This will allow for developing in frameworks like Iris or Martini. Your GOPATH will be set to /vagrant/goPath. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/installScripts/installGo.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for Personal prefs
while true; do
    echo "Lastly, Would you like to install some fun preferences? This will add a nice banner for everytime you ssh into your vagrant box, enable storing your github credentials for 12 hours, and use bash-it. (y/n)"
    read yn
    case $yn in
        [Yy]* ) sh /vagrant/vagrantBoxExtras/configFiles/personalPrefs.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

echo ""
echo "Your vagrant box has now finished provisioning! Remember, the install scripts can be run anytime by entering 'sh vagrant/vagrantBoxExtras/installScripts/YOUR_DESIRED_INSTALL'."
echo ""
