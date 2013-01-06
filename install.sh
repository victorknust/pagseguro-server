#!/bin/bash

clear
pwd > /tmp/root

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "É necessario ter permissão de root para executar este procedimento."
	exit 1
fi
# Verificando permissao de root.

# Atualizando o sistema.
SH=`dirname $0`/manifests/scripts/system-update.sh
sh $SH
# Atualizando o sistema.

# Instalando o puppet.
SH=`dirname $0`/manifests/scripts/puppet-install.sh
sh $SH
# Instalando o puppet.

# Aplicando os manifests do Puppet.
SH=`dirname $0`/manifests/scripts/run-all-manifests.sh
sh $SH
# Aplicando os manifests do Puppet.
