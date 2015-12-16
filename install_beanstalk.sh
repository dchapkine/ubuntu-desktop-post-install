#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# todo: find better check
if hash beanstalkd 2>/dev/null; then
	echo "  beanstalk server already installed"
else
	echo "  beanstalk server not installed"

	sudo apt-get -y install beanstalkd &>> $SCRIPT_LOGFILE

	wget https://github.com/tyba/beanstool/releases/download/v0.1.0/beanstool_v0.1.0_linux_amd64.tar.gz
	tar -xvzf beanstool_v0.1.0_linux_amd64.tar.gz
	cp beanstool_v0.1.0_linux_amd64/beanstool /usr/local/bin/

fi


# todo: find better check
if hash beanstool 2>/dev/null; then
	echo "  beanstool already installed"
else
	echo "  beanstool not installed"

	mkdir -p ~/tmp/beanstool
	cd ~/tmp/beanstool

	wget https://github.com/tyba/beanstool/releases/download/v0.1.0/beanstool_v0.1.0_linux_amd64.tar.gz
	tar -xvzf beanstool_v0.1.0_linux_amd64.tar.gz
	sudo cp beanstool_v0.1.0_linux_amd64/beanstool /usr/local/bin/

	rm -rf ~/tmp/beanstool

fi

