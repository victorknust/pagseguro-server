#!/bin/bash

[ -f /tmp/fqdn-escape ] && 	exit 0

FQDN=""
HOSTS=/etc/hosts
HOSTNAME=/etc/hostname
SO_VALUE=$(cat $HOSTNAME)

read -p "Informe o FQDN[$SO_VALUE]: " FQDN
[ -z "$FQDN" ] && FQDN=$SO_VALUE

echo $FQDN > $HOSTNAME
hostname -F $HOSTNAME

ALIAS=$(echo $FQDN | cut -d. -f1)
echo "127.0.0.1	localhost.localdomain	localhost" > $HOSTS
echo "127.0.0.1	$FQDN	$ALIAS"                   >> $HOSTS

> /tmp/fqdn-escape
