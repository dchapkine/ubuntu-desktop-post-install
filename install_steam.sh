#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME




DISTRIBUTOR=$(lsb_release -i | awk -F"\t" '{print $2}')

if [ "$DISTRIBUTOR" = "Ubuntu" ]; then

	. /etc/lsb-release
	echo $DISTRIB_DESCRIPTION

	if [ "$DISTRIB_RELEASE" = "14.04" ]; then

		# tested: works on ubuntu 14.04.3 gnome
		# http://doc.ubuntu-fr.org/steam


		# todo: check if it works with previous versions of 14.04
		# http://askubuntu.com/questions/588024/steam-install-error-on-14-04-ubuntu-64bit
		sudo apt-get -y install libc6:i386 libgl1-mesa-dri-lts-vivid:i386 libgl1-mesa-glx-lts-vivid:i386 &>> $SCRIPT_LOGFILE


		#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B05498B7 &>> $SCRIPT_LOGFILE
		#echo "deb http://repo.steampowered.com/steam/ precise steam" | sudo tee -a  /etc/apt/sources.list.d/steam.list &>> $SCRIPT_LOGFILE
		#sudo apt-get -y update >> $SCRIPT_LOGFILE
		#sudo apt-get -y install steam-launcher >> $SCRIPT_LOGFILE

		sudo apt-get -y install steam >> $SCRIPT_LOGFILE

	elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

		sudo add-apt-repository multiverse
		sudo apt-get install steam

	else
		
		echo ""
		echo "Sorry, your ubuntu version is not supported. You are running $DISTRIB_RELEASE"
		echo ""

	fi

else
	echo ""
	echo "Sorry, this script only works with Ubuntu. You are running $DISTRIBUTOR"
	echo ""
fi



