class update {
	notify {"Atualizando o sistema operacional: $operatingsystem":}
	case $operatingsystem {
		Debian,Ubuntu: {
			$file = "/etc/apt/update_initiator"
			file {"$file":
				ensure  => present,
				content => "",
				owner   => root,
				group   => root,
				mode    => 0644,
			}
			exec {"apt-get update":
				path => "/usr/bin",
			}
			exec {"apt-get -y dist-upgrade":
				path        => "/usr/bin",
				#refreshonly => true,
				#subscribe   => File["$file"],
				#timeout     => 3600,
			}
		}
		CentOS,RedHat: {
			exec {"yum -y update":
				path => "/usr/bin",
			}
		}
	}
}
class {"update":}
