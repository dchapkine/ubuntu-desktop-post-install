#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome

echo "[TODO] install nginx"

sudo apt-get -y install nginx >> $SCRIPT_LOGFILE

echo "[DONE] install nginx"
echo ""
echo "If you want to allow access only from localhost, you need to edit your /etc/nginx/sites-enabled/default"
echo ""
echo "location / {"
echo "	allow 127.0.0.1;"
echo "	deny all;"
echo "	... keep rest of the config here ..."
echo "}"
echo ""


