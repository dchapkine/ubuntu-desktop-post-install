#!/bin/bash

sudo mkdir -p /tmp/kernel_4_5_0
cd /tmp/kernel_4_5_0

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.5-wily/linux-headers-4.5.0-040500_4.5.0-040500.201603140130_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.5-wily/linux-headers-4.5.0-040500-generic_4.5.0-040500.201603140130_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.5-wily/linux-image-4.5.0-040500-generic_4.5.0-040500.201603140130_amd64.deb

sudo dpkg -i *.deb
