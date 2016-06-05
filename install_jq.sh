#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking gcc
if hash gcc 2>/dev/null; then
	echo "  checking gcc => ok"
else
	echo "  checking gcc => gcc not installed, please install it and retry"
	exit;
fi

# checking make
if hash make 2>/dev/null; then
	echo "  checking make => ok"
else
	echo "  checking make => make not installed, please install it and retry"
	exit;
fi


sudo apt-get -y install libtool autotools-dev &>> $SCRIPT_LOGFILE


cd ~
rm -rf ~/.jq
git clone https://github.com/stedolan/jq.git ~/.jq
cd ~/.jq
autoreconf -i
./configure --disable-maintainer-mode
make
sudo make install
rm -rf ~/.jq

#sudo apt-get -y install jq &>> $SCRIPT_LOGFILE