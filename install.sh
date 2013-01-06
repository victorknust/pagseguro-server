#!/bin/bash

clear

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "E necessario ter permissao de root para executar este procedimento."
	exit 1
fi
# Verificando permissao de root.

# Verificando diretorio de trabalho.
export ROOT=/root/pagseguro-server
if [ `pwd` != $ROOT ]; then
	echo 'O diretorio de instalacao deve ser "/root/pagseguro-server".'
	exit 1
fi
# Verificando diretorio de trabalho.

# Atualizando o sistema.
SH=`dirname $0`/manifests/scripts/system-update.sh
sh $SH
# Atualizando o sistema.

# Instalando o puppet.
PUPPET=`dpkg -l | grep puppet | wc -l`
if [ $PUPPET == 0 ]; then
	apt-get update
	apt-get install -y puppet
	clear
fi
# Instalando o puppet.

# Aplicando os manifests do Puppet.
export MANIFESTS=`dirname $0`/manifests
for manifest in `ls $MANIFESTS`
do
	if [[ $manifest != "files" && $manifest != "scripts" ]]; then
		puppet apply $MANIFESTS/$manifest
	fi
done
# Aplicando os manifests do Puppet.
