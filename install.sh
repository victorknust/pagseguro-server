#!/bin/bash

# Verificando permissao de root.
if [ "`id -u`" != 0 ]; then
	echo "E necessario ter permissao de root para executar este procedimento."
	exit 1
fi
# Verificando permissao de root.

clear
export FACTER_ROOT=$(pwd)

# Configurando o FQDN.
./`dirname $0`/manifests/scripts/fqdn-configure.sh

# Atualizando o sistema.
./`dirname $0`/manifests/scripts/system-update.sh

# Instalando o puppet.
./`dirname $0`/manifests/scripts/puppet-install.sh

# Aplicando os manifests do Puppet.
./`dirname $0`/manifests/scripts/run-all-manifests.sh
