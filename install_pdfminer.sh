#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# checking pdf2txt.py
if hash pdf2txt.py 2>/dev/null; then
	echo "  checking pdf2txt.py => ok"
else
	echo "  checking pdf2txt.py => pdf2txt.py not installed, installing it now"

		rm -rf ~/.pdfminer
		mkdir -p ~/.pdfminer
		cd ~/.pdfminer

		git clone git@github.com:euske/pdfminer.git .
		sudo python setup.py install

	exit;
fi




