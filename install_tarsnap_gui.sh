#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking tarsnap-gui
if hash tarsnap-gui 2>/dev/null; then
	echo "  tarsnap-gui already installed"
else
	echo "  tarsnap-gui not installed, installing it now"

	# install dependencies
	sudo apt-get -y install g++ git qtbase5-dev 

	# get latest sources
	version="v0.9";
	mkdir -p ~/.tarsnap_gui/installer/$version
	cd ~/.tarsnap_gui/installer/$version
	git clone https://github.com/Tarsnap/tarsnap-gui.git && cd tarsnap-gui
	git checkout $version

	# compile
	QT_SELECT=qt5 qmake && make -j$(nproc)

	#
	./tarsnap-gui
	
	echo "run this to start: ./tarsnap-gui"

fi
