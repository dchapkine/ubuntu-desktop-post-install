#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


#
# CHECK DISTRO VERSION
#
. /etc/lsb-release
echo $DISTRIB_DESCRIPTION


#
# UBUNTU 14.04 VERSION
#
if [ "$DISTRIB_RELEASE" = "14.04" ]; then

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


#
# UBUNTU 16.04 VERSION
#
elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

	echo "running UBUNTU 16.04 version"

	if hash phpbrew 2>/dev/null; then
		echo "  phpbrew already installed"
	else
		echo "  phpbrew not installed => installing phpbrew"

		sudo apt-get -y build-dep php7.0
		sudo apt-get install -y php7.0 php7.0-dev php7.0-cli php7.0-curl
		sudo apt-get install -y php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev bison libbz2-dev libreadline-dev libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev libssl-dev openssl gettext libgettextpo-dev libgettextpo0 libicu-dev libmhash-dev libmhash2 libmcrypt-dev libmcrypt4

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

else
	echo "no compatible installer found for your distribution"
fi



