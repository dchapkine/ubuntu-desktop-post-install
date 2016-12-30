#!/bin/bash

# tested on ubuntu 16.04 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# todo: find better check
if hash rancher 2>/dev/null; then
	echo "  rancher already installed"
else
	echo "  rancher not installed"

	rm -rf ~/tmp/rancher
	mkdir -p ~/tmp/rancher
	cd ~/tmp/rancher

	wget https://github.com/rancher/cli/releases/download/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz
	tar -xvzf rancher-linux-amd64-v0.4.1.tar.gz
	sudo cp rancher-v0.4.1/rancher /usr/local/bin/

	rm -rf ~/tmp/rancher

fi

