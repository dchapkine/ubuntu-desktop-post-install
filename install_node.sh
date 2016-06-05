#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking nvm
if grep -Fxq '# installed by ubuntu-desktop-post-install/install_nvm.sh #' ~/.bashrc
then
	echo "  nvm already installed"
else
	echo "  checking nvm => nvm not installed, please install it and retry"
	exit;
fi

# checking nodejs
if hash node 2>/dev/null; then
	echo "  checking node => ok"
else
	echo "  checking node => node not installed, installing it now"
	nvm install 4.4
fi

