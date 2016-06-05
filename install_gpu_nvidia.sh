#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 16.04 gnome

# add nvidia ppa
grep graphics-drivers/ppa /etc/apt/sources.list /etc/apt/sources.list.d/*

if [ "$?" != "0" ] ; then
	echo "  nvidia ppa already added"
else
	echo "  nvidia ppa not added yet"

	sudo apt-get -y purge nvidia-*
	sudo add-apt-repository ppa:graphics-drivers/ppa
	sudo apt-get -y update
fi

# install nvidia drivers and nvidia prime
dpkg-query -l "nvidia-prime" | grep -q ^.i

if [ "$?" != "0" ] ; then
	echo "  nvidia-prime package already installed"
else
	echo "  nvidia-prime package not installed"

	sudo apt-get -y install nvidia-367 nvidia-prime
	
	#sudo service gdm3 restart

fi



