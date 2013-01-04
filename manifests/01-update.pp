class update {
	
	notify {"Atualizando o sistema operacional: $operatingsystem":}
	
	case $operatingsystem {
		Debian,Ubuntu: {
			$command = "apt-get update && apt-get -y upgrade"
		}
		CentOS,RedHat: {
			$command = "yum -y update"
		}
	}
	
	exec {"$command":
		path => "/usr/bin"
	}
}
class {"update":}
