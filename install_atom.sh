#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome


URL='https://atom.io/download/deb'
FILE=`mktemp`
wget "$URL" -qO $FILE
sudo dpkg -i $FILE
rm $FILE


