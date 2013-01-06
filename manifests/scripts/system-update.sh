#!/bin/bash

if [ -f /usr/bin/apt-get ]; then
	# Update para Debian/Ubuntu.
	/usr/bin/apt-get update
	/usr/bin/apt-get -y upgrade
else
	# Update para RedHat/CentOS.
	yum -y update
fi
