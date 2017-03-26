#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome
# tested: works on ubuntu 16.04 gnome

# checking redis
if hash redis 2>/dev/null; then
	echo "  checking redis => ok"
else
	echo "  checking redis => redis not installed, installing it now"


	sudo add-apt-repository -y ppa:chris-lea/redis-server
	sudo apt-get -y update
	sudo apt-get -y install redis-server


fi




