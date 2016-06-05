#!/bin/bash


sudo mkdir -p /tmp/kernel_4_6_0
cd /tmp/kernel_4_6_0

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.6-yakkety/linux-headers-4.6.0-040600_4.6.0-040600.201605151930_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.6-yakkety/linux-headers-4.6.0-040600-generic_4.6.0-040600.201605151930_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.6-yakkety/linux-image-4.6.0-040600-generic_4.6.0-040600.201605151930_amd64.deb

sudo dpkg -i *.deb
