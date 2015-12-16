#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome



# checking ladon
if hash ladon 2>/dev/null; then
	echo "  checking ladon => ok"
else
	echo "  checking ladon => ladon not installed, installing it now"
	npm install -g ladon
fi



# checking jpeg-archive
if hash jpeg-archive 2>/dev/null; then
	echo "  checking jpeg-archive => ok"
else
	echo "  checking jpeg-archive => jpeg-archive not installed, installing it now"

	# installing mozjpeg
	echo "    installing mozjpeg"
	mkdir -p ~/tmp/
	cd ~/tmp
	rm -rf ~/tmp/mozjpeg
	sudo apt-get -y install build-essential autoconf pkg-config nasm libtool
	git clone https://github.com/mozilla/mozjpeg.git
	cd mozjpeg
	autoreconf -fiv 
	./configure --with-jpeg8 
	make 
	sudo make install 
	rm -rf ~/tmp/mozjpeg

	# installing jpeg-archive
	echo "    installing jpeg-archive"
	mkdir -p ~/tmp/
	cd ~/tmp
	rm -rf ~/tmp/jpeg-archive
	git clone https://github.com/danielgtaylor/jpeg-archive.git 
	cd jpeg-archive

	make 
	sudo make install 

	rm -rf ~/tmp/jpeg-archive



fi
