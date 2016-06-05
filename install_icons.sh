#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME




mkdir -p ~/.local/share/icons/SuperFlatRemix
cp -R files/icons/Super-Flat-Remix-master/Super\ Flat\ Remix/* ~/.local/share/icons/SuperFlatRemix &>> $SCRIPT_LOGFILE

echo "  please enable 'SuperFlatRemix' icon set in gnome-tweak-tools"


