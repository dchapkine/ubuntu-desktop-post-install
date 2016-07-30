#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME



if hash docker-machine 2>/dev/null; then
	echo "  docker-machine already installed"
else
	echo "  docker-machine not installed => installing docker-machine"

	rm -rf ~/tmp/docker-machine
	mkdir -p ~/tmp/docker-machine
	cd ~/tmp/docker-machine

	wget -O docker-machine https://github.com/docker/machine/releases/download/v0.8.0/docker-machine-`uname -s`-`uname -m`
	sudo mv ~/tmp/docker-machine/docker-machine /usr/local/bin/docker-machine
	sudo chmod +x /usr/local/bin/docker-machine

	rm -rf ~/tmp/docker-machine

fi

