#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# see http://cordova.apache.org/docs/en/5.0.0/guide_platforms_ubuntu_index.md.html#Ubuntu%20Platform%20Guide
# see https://developer.ubuntu.com/en/apps/html-5/guides/cordova-guide/

if hash cordova 2>/dev/null; then

	echo "  check cordova => OK"

	sudo add-apt-repository -y ppa:cordova-ubuntu/ppa &>> $SCRIPT_LOGFILE
	sudo apt-get -y update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install cordova-cli &>> $SCRIPT_LOGFILE



	echo ""
	echo "  Here is how to create and run a ubuntu hello world app:"
	echo "  cd ~/Desktop && cordova create hello-ubuntu com.example.hello HelloWorld && cd hello-ubuntu"
	echo "  cordova platform add ubuntu"
	echo "  !!! MAKE SURE YOU ADD THIS LINE IN config.xml: <icon src=\"/img/logo.png\"/> !!! WILL NOT WORK WITHOUT THIS"
	echo "  cordova build ubuntu"
	echo "  cordova run ubuntu"
	echo ""
 

else

	echo "  check cordova => please install cordova first, then retry"


    

fi

