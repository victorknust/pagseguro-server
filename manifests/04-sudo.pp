class sudo {
	
	notify{"Configurando o SUDO":}
	
	group {"admin":
		ensure => present,
		gid    => 10000
	}
	
	package {"sudo":
		ensure => present,
	}
	
	case $operatingsystem {
		Debian,Ubuntu: {
			$sudofile = "sudoers.debian"
		}
		RedHat,CentOS: {
			$sudofile = "sudoers.redhat"
		}
	}
	
	file {"/etc/sudoers":
		ensure  => present,
		source  => "$root/manifests/files/sudo/$sudofile",
		owner   => root,
		group   => root,
		mode    => 0440,
		require => Package["sudo"],
	}
	
}
class {"sudo":}
