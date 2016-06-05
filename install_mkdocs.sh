#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# checking python
if hash python 2>/dev/null; then
	echo "  checking python => ok"
else
	echo "  checking python => python not installed, please install it and retry"
	exit;
fi

# checking pip
if hash pip 2>/dev/null; then
	echo "  checking pip => ok"
else
	echo "  checking pip => pip not installed, please install it and retry"
	exit;
fi

# check python-dev
dpkg -s python-dev &>> /dev/null
if [ $? -eq 0 ] ; then
	echo "  checking python-dev package => ok"
else
	echo "  checking python-dev => python-dev not installed, installing it now"
	sudo apt-get -y install python-dev
fi

# checking mkdocs
if hash mkdocs 2>/dev/null; then
	echo "  checking mkdocs => ok"
else
	echo "  checking mkdocs => mkdocs not installed, installing it now"
	sudo pip install markupsafe
	sudo pip install mkdocs
fi


