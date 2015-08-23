#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME




mkdir -p ~/.local/share/icons/SuperFlatRemix
cp -R files/icons/Super-Flat-Remix-master/Super\ Flat\ Remix/* ~/.local/share/icons/SuperFlatRemix &>> $SCRIPT_LOGFILE

echo "Don't forget to enable 'SuperFlatRemix' icon set in 'gnome tweak tools' app"


