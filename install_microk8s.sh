#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 16.04.4 gnome

# checking microk8s
# https://microk8s.io/docs/
if hash microk8s.status 2>/dev/null; then
	echo "  checking microk8s => ok"
else
	echo "  checking microk8s => microk8s not installed, installing it now"
	sudo snap install microk8s --classic --channel=1.17/stable
	sudo usermod -a -G microk8s $USER
	echo "please open new session to be able to use microk8s without sudo"
	echo "su - $USER"
	echo ""
	echo "microk8s.start  to start"
	echo "microk8s.stop  to stop"
	echo "see docs: https://microk8s.io/docs"
	exit;
fi
sudo microk8s.status --wait-ready
