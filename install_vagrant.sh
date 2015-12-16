#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# see http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts

# checking virtualbox
if hash virtualbox 2>/dev/null; then
	echo "  checking virtualbox => ok"
else
	echo "  checking virtualbox => virtualbox not installed, please install it and retry"
	exit;
fi


if hash vagrant 2>/dev/null; then
	echo "  vagrant already installed"
else

	echo "  vagrant not installed => installing vagrant"

	# install dependencies
	sudo apt-get -y install virtualbox-dkms &>> $SCRIPT_LOGFILE 

	# old
	#sudo apt-get -y install vagrant &>> $SCRIPT_LOGFILE
	URL='https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb'
	FILE=`mktemp`
	wget "$URL" -qO $FILE
	sudo dpkg -i $FILE
	rm $FILE




fi

