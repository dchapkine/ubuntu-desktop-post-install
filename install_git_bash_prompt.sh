#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome


if grep -Fxq '# installed by ubuntu-desktop-post-install/install_git_bash_prompt.sh #' ~/.bashrc
then

	echo "  bash-git-prompt already installed"

else

	cd ~
	git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# bash-git-prompt' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_git_bash_prompt.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo 'source ~/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc
	echo '' >> ~/.bashrc

fi

