#!/bin/bash

. ./_env.sh

# tested on ubuntu 24.04.3 (gnome)

TF_VERSION=1.13.3
SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# checking terraform
if hash terraform 2>/dev/null; then
	echo "  terraform already installed"
else
	echo "  terraform not installed, installing it now"

	# make tmp env
	#set -euo pipefail
	tmpdir="$(mktemp -d)"
	trap 'rm -rf "$tmpdir"' EXIT  # auto-remove even if something fails
	cd "$tmpdir"
	pwd

	# installation
	wget https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_${ENV_OS}_${ENV_ARCH}.zip
	unzip terraform_${TF_VERSION}_${ENV_OS}_${ENV_ARCH}.zip
	chmod 755 terraform
	echo "copying terraform to /usr/local/bin..."
	sudo cp terraform /usr/local/bin/

	# alternative
	#wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	#sudo apt update && sudo apt install terraform

	# cleanup
	echo "cleaning up tmp dir..."
	cd -
	pwd
	rm -rf $tmpdir

	# testing
	terraform --version
fi
