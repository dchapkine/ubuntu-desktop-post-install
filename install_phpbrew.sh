#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

if hash phpbrew 2>/dev/null; then
	echo "  phpbrew already installed"
else
	echo "  phpbrew not installed => installing phpbrew"

	sudo apt-get -y build-dep php5
	sudo apt-get install -y php5 php5-dev php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php5-cli bison libbz2-dev libreadline-dev libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev libssl-dev openssl gettext libgettextpo-dev libgettextpo0 libicu-dev libmhash-dev libmhash2 libmcrypt-dev libmcrypt4

	cd ~
	curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
	chmod +x phpbrew
	sudo mv phpbrew /usr/local/bin/phpbrew


fi



if grep -Fxq '# installed by ubuntu-desktop-post-install/install_phpbrew.sh #' ~/.bashrc
then
	
	echo "  phpbrew already added to bashrc"

else

	phpbrew init
	
	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# phpbrew' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_phpbrew.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '' >> ~/.bashrc
	echo '[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc' >> ~/.bashrc

fi


echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
echo "      cool tricks"
echo "      phpbrew known"
echo "      phpbrew install 7.0 +default"
echo "      phpbrew use 7.0"


