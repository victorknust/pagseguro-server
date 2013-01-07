#!/bin/bash

PUPPET=$(dpkg -l | grep puppet | wc -l)
if [ $PUPPET == 0 ]; then
	if [ -f /usr/bin/apt-get ]; then
		# Instalando o Puppet em Debian/Ubuntu.
        	apt-get update
        	apt-get install -y puppet
	else
		# Instalando o Puppet em RedHat/CentOS.
		yum -y install puppet
	fi
fi
clear
