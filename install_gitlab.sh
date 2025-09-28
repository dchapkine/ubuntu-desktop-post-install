#!/bin/bash

. ./_env.sh

# tested on ubuntu 24.04.3 (gnome)

GITLAB_VERSION=18.4
SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# checking gitlab-ctl availability
if hash gitlab-ctl 2>/dev/null; then
	echo "  gitlab already installed"
else
	echo "  gitlab not installed, installing it now"

	# installation
	sudo apt install -y curl
	curl "https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh" | sudo bash
	echo '127.0.0.1 gitlab.dev' | sudo tee -a /etc/hosts >/dev/null
	cat /etc/hosts
	sudo GITLAB_ROOT_EMAIL="admin@gitlab.dev" GITLAB_ROOT_PASSWORD="ChangeP@ssW0rd" EXTERNAL_URL="http://gitlab.dev" apt install -y gitlab-ee gitlab-runner docker.io

	# runner
	# create runner from gui
	#export RUNNER_TOKEN=...
	#sudo gitlab-runner register --non-interactive --url "http://localhost/" --token "$RUNNER_TOKEN" --executor "docker" --docker-image alpine:latest --description "docker-runner"

	# testing
	sudo gitlab-ctl status
fi
