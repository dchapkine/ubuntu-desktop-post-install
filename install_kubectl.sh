#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking kubectl
if hash kubectl 2>/dev/null; then
	echo "  kubectl already installed"
else
	echo "  kubectl not installed, installing it now"

	rm -rf ~/tmp/kubectl
	mkdir -p ~/tmp/kubectl
	cd ~/tmp/kubectl
	wget https://storage.googleapis.com/kubernetes-release/release/v1.4.6/kubernetes-client-linux-amd64.tar.gz
	tar -xf kubernetes-client-linux-amd64.tar.gz
	sudo cp ~/tmp/kubectl/kubernetes/client/bin/kubectl /usr/local/bin/kubectl
	sudo chmod +x /usr/local/bin/kubectl
	
fi
