#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html


if hash tlp 2>/dev/null; then
	echo "  tlp already installed"
else
	echo "  tlp not installed, installing it now"


	sudo add-apt-repository -y ppa:linrunner/tlp
	sudo apt-get -y update
	sudo apt-get -y install tlp tlp-rdw 

	# for thinkpads
	echo "if you have a thinkpad, run this: sudo apt-get install tp-smapi-dkms acpi-call-dkms" 

	echo ""
	echo ""

	echo "restart your laptop, OR run this:  sudo tlp start"
	echo "run this to check if tlp is working: sudo tlp-stat"

fi



