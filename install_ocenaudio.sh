#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome


#sudo add-apt-repository -y ppa:upubuntu-com/multimedia
#sudo apt-get -y update
#sudo apt-get -y install  ocenaudio


#sudo apt-get install -y libqt5gui5 libqt5core5a libqt5widgets5 libqt5network5 libqt5concurrent5
#URL='http://www.ocenaudio.com.br/downloads/index.php/ocenaudio_debian64.deb?version=2.9'
#FILE=`mktemp`
#wget "$URL" -qO $FILE
#sudo dpkg -i $FILE
#rm $FILE

