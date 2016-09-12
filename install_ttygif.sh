#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

if hash ttygif 2>/dev/null; then
	echo "  ttygif already installed"
else
	echo "  ttygif not installed"

	# install dependencies
	sudo apt-get -y install imagemagick ttyrec gcc x11-apps git
	
	# clone & compile
	rm -rf ~/.ttygif
	cd ~
	git clone https://github.com/icholy/ttygif.git ~/.ttygif
	cd ~/.ttygif
	make

	# install
	sudo make install
	
	# cleanup
	rm -rf ~/.ttygif

fi
