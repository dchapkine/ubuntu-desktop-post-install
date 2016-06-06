#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

if hash bats 2>/dev/null; then
	echo "  bats already installed"
else
	echo "  bats not installed"

	
	rm -rf ~/.bats
	cd ~
	git clone https://github.com/sstephenson/bats.git ~/.bats
	cd ~/.bats
	chmod +x ./install.sh
	sudo ./install.sh /usr/local
	rm -rf ~/.bats

fi

