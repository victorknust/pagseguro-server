#!/bin/bash

clear

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "É necessario ter permissão de root para executar este procedimento."
	exit 1
fi
# Verificando permissao de root.

# Verificando diretorio de trabalho.
export ROOT=/root/pagseguro-server
if [ `pwd` != $ROOT ]; then
	echo 'O diretório de instalação deve ser "/root/pagseguro-server".'
	exit 1
fi
# Verificando diretorio de trabalho.

# Atualizando o sistema.
SH=`dirname $0`/manifests/scripts/system-update.sh
sh $SH
# Atualizando o sistema.

# Instalando o puppet.
SH=`dirname $0`/manifests/scripts/puppet-install.sh
sh $SH
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
