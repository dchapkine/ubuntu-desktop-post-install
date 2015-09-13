#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


sudo apt-get -y install libpcsclite1 libpcsclite-dev pcscd pcsc-tools &>> $SCRIPT_LOGFILE
sudo apt-get -y install cardpeek cardpeek-data &>> $SCRIPT_LOGFILE
#npm install pcsclite

echo "  run pcsc_scan to see connected rfid readers and get infos from rfid tags"
echo "  gscriptor is a a gui to manage your rfid tags"
echo "  see http://ludovic.rousseau.free.fr/softwares/pcsc-tools/index.html"
echo "  also try cardpeek"

