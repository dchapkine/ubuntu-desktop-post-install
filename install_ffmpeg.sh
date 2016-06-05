#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


. /etc/lsb-release
echo $DISTRIB_DESCRIPTION

if [ "$DISTRIB_RELEASE" = "14.04" ]; then

	echo "running UBUNTU 14.04 version"
	
	sudo apt-get --purge remove ffmpeg &>> $SCRIPT_LOGFILE
	sudo apt-get --purge autoremove &>> $SCRIPT_LOGFILE

	sudo apt-get install ppa-purge &>> $SCRIPT_LOGFILE
	sudo ppa-purge ppa:jon-severinsson/ffmpeg &>> $SCRIPT_LOGFILE

	sudo add-apt-repository ppa:mc3man/trusty-media &>> $SCRIPT_LOGFILE
	sudo apt-get update &>> $SCRIPT_LOGFILE
	sudo apt-get dist-upgrade &>> $SCRIPT_LOGFILE

	sudo apt-get -y install ffmpeg &>> $SCRIPT_LOGFILE

elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

	echo "running UBUNTU 16.04 version"
	sudo apt-get -y install ffmpeg
else
	echo "no compatible installer found for your distribution"
fi
