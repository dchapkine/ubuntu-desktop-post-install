#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# see http://facebook.github.io/react-native/docs/getting-started.html#content


# todo: better check
# check android sdk
if hash adb 2>/dev/null; then
	echo "  checking adb => ok"
else
	echo "  checking adb => adb not installed, please install it and retry"
	exit;
fi



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


if hash react-native 2>/dev/null; then
	echo "  react-native already installed"
else

	echo "  react-native not installed => installing react-native"


	npm install -g react-native-cli &>> $SCRIPT_LOGFILE
	

	echo ""
	echo "  WARNING: You need android 5 to make it work for android (because of adb reverse command)"
	echo ""
	echo "  Here is how to run a hello world on your device:"
	echo "  cd ~/Desktop && react-native init AwesomeProject # this will take a while"
	echo "  cd AwesomeProject"
	echo "  react-native run-android"
	echo ""
	echo "  in another shell, run:"
	echo "   react-native start"
	echo ""
	echo "  In 3rd shell, run:"
	echo "   adb reverse tcp:8081 tcp:8081"
	echo ""
	echo ""
	echo "  See http://stackoverflow.com/questions/32572399/react-native-android-failed-to-load-js-bundle#answer-32574231"
	echo ""

fi






