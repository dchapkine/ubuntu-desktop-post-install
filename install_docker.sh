#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# this installs docker and makes it runnable without sudo
# because of that you will need to logout/login or reboot your machine after install

#https://docs.docker.com/installation/ubuntulinux/


####### OLD ########
#sudo apt-get -y install curl &>> $SCRIPT_LOGFILE 
#curl -sSL https://get.docker.com/ | sh &>> $SCRIPT_LOGFILE
#sudo usermod -aG docker $USER
#sudo service docker start &>> $SCRIPT_LOGFILE
####### OLD ########







if hash docker 2>/dev/null; then
	echo "  docker already installed"
else
	echo "  docker not installed => installing docker"

	
	sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
	sudo apt-get -y update
	sudo apt-get -y purge lxc-docker*
	sudo apt-cache policy docker-engine
	sudo apt-get -y install docker-engine
	sudo usermod -aG docker $USER

fi






echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"





