#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

if hash pyenv 2>/dev/null; then
	echo "  pyenv already installed"
else
	echo "  pyenv not installed => installing pyenv"

	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

fi


if grep -Fxq '# installed by ubuntu-desktop-post-install/install_pyenv.sh #' ~/.bashrc
then
	
	echo "  pyenv already added to bashrc"

else

	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# pyenv' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_pyenv.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '' >> ~/.bashrc
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
	echo 'export PATH="$HOME/.pyenv/shims:$PATH"' >> ~/.bashrc
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc

fi


echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
echo "      cool tricks"
echo "      pyenv install --list"
echo "      pyenv install 2.7.9"
echo "		pyenv rehash"
echo "      pyenv global 2.7.9"


