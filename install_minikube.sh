#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking minikube
if hash minikube 2>/dev/null; then
	echo "  minikube already installed"
else
	echo "  minikube not installed, installing it now"

	curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.12.2/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

fi
