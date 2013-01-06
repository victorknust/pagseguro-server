#!/bin/bash

clear
pwd > /tmp/root

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "É necessario ter permissão de root para executar este procedimento."
	exit 1
fi
# Verificando permissao de root.

# Configurando o FQDN.
sh `dirname $0`/manifests/scripts/fqdn-configure.sh

# Atualizando o sistema.
sh `dirname $0`/manifests/scripts/system-update.sh

# Instalando o puppet.
sh `dirname $0`/manifests/scripts/puppet-install.sh

# Aplicando os manifests do Puppet.
sh `dirname $0`/manifests/scripts/run-all-manifests.sh
