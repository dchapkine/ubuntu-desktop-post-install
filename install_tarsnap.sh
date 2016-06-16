#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking tarsnap
if hash tarsnap 2>/dev/null; then
	echo "  tarsnap already installed"
else
	echo "  tarsnap not installed, installing it now"

	# install dependencies
	sudo apt-get -y install build-essential ext2fs-dev zlib1g-dev libssl-dev 

	# get latest sources
	version="1.0.37";
	mkdir -p ~/.tarsnap/installer/$version
	cd ~/.tarsnap/installer/$version
	wget https://www.tarsnap.com/download/tarsnap-autoconf-$version.tgz
	wget https://www.tarsnap.com/download/tarsnap-sigs-$version.asc
	
	# display signatures
	gpg --decrypt tarsnap-sigs-$version.asc
	shasum -a 256 tarsnap-autoconf-$version.tgz

	# extract & compile
	tar -xzf tarsnap-autoconf-$version.tgz
	cd tarsnap-autoconf-$version/
	./configure
	make all
	sudo make install

	# https://www.tarsnap.com/gettingstarted.html
	sudo mv /usr/local/etc/tarsnap.conf.sample /usr/local/etc/tarsnap.conf

	echo ""
	echo "What to do next ?"
	echo "-configure this machine"
	echo "  sudo tarsnap-keygen --keyfile /root/tarsnap.key --user me@example.com --machine mybox"
	echo ""
	echo "-make a test backup of current directory"
	echo "  sudo /usr/local/bin/tarsnap -v --print-stats -c -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" ."
	echo ""
	echo "-list all archives in the account"
	echo "  sudo tarsnap --list-archives"
	echo ""
	echo "-restore an archive"
	echo "  tarsnap -x -f mybackup-2015-08-09_19-37-20"
	echo "  # note that it will restore directories as it was in current directory"

fi
