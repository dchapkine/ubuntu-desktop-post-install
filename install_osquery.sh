#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# TODO: recheck if e realy need force-yes to install

if hash osqueryi 2>/dev/null; then
	echo "  osquery server already installed"
else
	echo "  osquery server not installed"

	#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9D8B80B
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B

	sudo add-apt-repository -y --force-yes "deb [arch=amd64] https://osquery-packages.s3.amazonaws.com/trusty trusty main"
	sudo apt-get -y --force-yes update

	# --force-yes  =>> W: GPG error: https://osquery-packages.s3.amazonaws.com trusty InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 97A80C63C9D8B80B
	sudo apt-get -y --force-yes install osquery
fi

