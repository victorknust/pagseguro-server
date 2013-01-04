class update {
	notify {"Atualizando o sistema operacional: $operatingsystem":}
	case $operatingsystem {
		Debian,Ubuntu: {
			exec {"apt-get update":
				path => "/usr/bin"
			}
			exec {"apt-get -y upgrade":
				path => "/usr/bin"
			}
		}
		CentOS,RedHat: {
			exec {"yum -y update":
				path => "/usr/bin"
			}
		}
	}
}
class {"update":}
