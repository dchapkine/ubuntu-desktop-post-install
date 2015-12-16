#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME


sudo rm -rf ~/.esptool
mkdir -p ~/.esptool
cd ~/.esptool
git clone https://github.com/themadinventor/esptool
cd ./esptool
sudo python setup.py install


