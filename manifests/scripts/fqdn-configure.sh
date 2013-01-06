#!/bin/bash

if [ -f /tmp/fqdn-escape ]; then
	exit 0
fi

HOSTS=/etc/hosts
HOSTNAME=/etc/hostname
SO_VALUE=$(cat $HOSTNAME)
read -p "Informe o FQDN[$SO_VALUE]: " FQDN

if [ "$FQDN" == "" ]; then
	FQDN=$SO_VALUE
fi

echo $FQDN > $HOSTNAME
hostname -F $HOSTNAME

ALIAS=$(echo $FQDN | cut -d. -f1)
echo "127.0.0.1	localhost.localdomain	localhost" > $HOSTS
echo "127.0.0.1	$FQDN	$ALIAS"                   >> $HOSTS

> /tmp/fqdn-escape
