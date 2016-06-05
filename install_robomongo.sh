#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

sudo apt-get install -y libxcb-render-util0 libxcb-xkb1 libxkbcommon-x11-0


URL='http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb'
FILE=`mktemp`
wget "$URL" -qO $FILE
sudo dpkg -i $FILE
rm $FILE



