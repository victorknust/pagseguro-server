#!/bin/bash

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "E necessario ter permissão de root para executar este procediment"
	exit 1
fi
# Verificando permissao de root.

clear
pwd > /tmp/root
export FACTER_ROOT=$(pwd)

# Configurando o FQDN.
sh `dirname $0`/manifests/scripts/fqdn-configure.sh

# Atualizando o sistema.
sh `dirname $0`/manifests/scripts/system-update.sh

# Instalando o puppet.
sh `dirname $0`/manifests/scripts/puppet-install.sh

# Aplicando os manifests do Puppet.
sh `dirname $0`/manifests/scripts/run-all-manifests.sh
