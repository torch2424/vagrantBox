# VagrantFiles

Vagrant files to make my life ALOT easier, it will set up virtual dev environments for all of my codes

![Vagrant ssh gif](http://i.imgur.com/WTwbWYz.gif)

# How the Vagrant Environment is set up

The folder "common" is where alot of the provisioning and configured files are stored for reference or used to install environments.

The folder "vagrantBox" is where the vagrant box is created, and where its ports are configrued, and X11 forwarding happens.

The folder "source" is where repos can be cloned and will be .gitignored.

The folder "html" is where web servers will look for websites can be cloned and will be .gitignored. Can clone repos into here, or copy pasta projects/websites into here.

# FAQ's (Well I am assuming these would be FAQ's)

1. How do I run X install script again?
- Install scripts can be run with  'sh /vagrant/vagrantBoxExtras/installScript/YOUR_DESIRED_INSTALL'

2. What ports on my vagrant box go where?
- Port 80 in vagrant is mapped to post 8080 on the host (http://localhost:8080)
- Port 8000 in vagrant is mapped to post 8000 on the host (http://localhost:8000)
- Port 4000 in vagrant is mapped to post 4000 on the host (http://localhost:4000)

3. I found something wrong with the box, how can I fix it for everyone?
- Please, if you find any issues make a pull request, that way this can become a better vagrant box for everyone!
