#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome
# tested: works on ubuntu 16.04 gnome

# this installs docker and makes it runnable without sudo
# because of that you will need to logout/login or reboot your machine after install

#https://docs.docker.com/installation/ubuntulinux/


. /etc/lsb-release
echo $DISTRIB_DESCRIPTION


if hash docker 2>/dev/null; then
    echo "  docker already installed"
else
    echo "  docker not installed => installing docker"

    if [ "$DISTRIB_RELEASE" = "14.04" ]; then

	
	sudo apt-get update
	sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
	sudo apt-get -y update
	sudo apt-get -y purge lxc-docker*
	sudo apt-cache policy docker-engine
	sudo apt-get -y install docker-engine
	sudo usermod -aG docker $USER
	

    elif [ "$DISTRIB_RELEASE" = "16.04" ]; then
	
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt-get -y update
	apt-cache policy docker-engine
	sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
	sudo apt-get -y install docker-engine
	sudo usermod -aG docker $USER
	sudo service docker start

    fi
fi




echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"





