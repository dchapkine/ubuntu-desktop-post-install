#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME



. /etc/lsb-release
echo $DISTRIB_DESCRIPTION


if hash ansible 2>/dev/null; then
	echo "  ansible already installed"
else
	echo "  ansible not installed"

	sudo apt-get  -y install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get -y update
	sudo apt-get -y install ansible

fi

