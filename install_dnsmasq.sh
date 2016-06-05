#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash dnsmasq 2>/dev/null; then
	echo "  dnsmasq already installed"
else
	echo "  dnsmasq not installed, installing it now"

	sudo apt-get -y install dnsmasq
	echo "	now edit this file: sudo emacs /etc/dnsmasq.conf"
	echo "	don't forget to restart"

fi

