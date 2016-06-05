#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome


if hash php 2>/dev/null; then
	echo "  php installed"
else
	echo "  php not installed => please install it first"
	exit;
fi


if hash composer 2>/dev/null; then
	echo "  composer already installed"
else
	echo "  composer not installed => installing composer"

	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# composer' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_composer.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc
	echo '' >> ~/.bashrc

fi


echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"



