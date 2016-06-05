#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# see http://dasunhegoda.com/installrun-phonegap-ubuntu/797/
# see http://cordova.apache.org/docs/en/5.0.0/guide_platforms_android_index.md.html#Android%20Platform%20Guide

# checking nodejs
if hash node 2>/dev/null; then
	echo "  checking node => ok"
else
	echo "  checking node => node not installed, please install it and retry"
	exit;
fi

# checking npm
if hash npm 2>/dev/null; then
	echo "  checking npm => ok"
else
	echo "  checking npm => npm not installed, please install it and retry"
	exit;
fi

# checking jdk
# todo: better check for jdk
if hash javac 2>/dev/null; then
	echo "  checking jdk => ok"
else
	echo "  checking jdk => jdk not installed, please install it and retry"
	exit;
fi


# checking git
if hash git 2>/dev/null; then
	echo "  checking git => ok"
else
	echo "  checking git => git installing git"
	sudo apt-get -y install git &>> $SCRIPT_LOGFILE 
fi

# checking ant
if hash ant 2>/dev/null; then
	echo "  checking ant => ok"
else
	echo "  checking ant => installing ant"
	sudo apt-get -y install ant &>> $SCRIPT_LOGFILE 
fi



if hash cordova 2>/dev/null; then
	echo "  cordova already installed"
else

	echo "  cordova not installed => installing cordova"

	# install dependencies
	sudo apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6 &>> $SCRIPT_LOGFILE 

	#
	npm install -g cordova &>> $SCRIPT_LOGFILE
	npm install -g plugman &>> $SCRIPT_LOGFILE

	# tips
	echo "  NOTE: you will probably need to install a new version of android sdk using 'Android SDK Manager' before using cordova"


	echo ""
	echo "  Here is how to run a hello world on your device:"
	echo "  cd ~/Desktop && cordova create hello com.example.hello HelloWorld && cd hello"
	echo "  cordova platform add android"
	echo "  cordova build android"
	echo "  cordova run android --device"
	echo ""

fi






