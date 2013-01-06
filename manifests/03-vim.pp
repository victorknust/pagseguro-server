class vim {
	
	notify{"Instalando o VIM":}
	$root = file("/tmp/root")

	notify{"$root/oi":}
	
	case $operatingsystem {
		RedHat,CentOS: {
			$vim     = "vim-enhanced"
			$vimpath = "/etc"
			$vimfile = "vimrc.redhat"
		}
		Debian,Ubuntu: {
			$vim     = "vim"
			$vimpath = "/etc/vim"
			$vimfile = "vimrc.debian"
		}
	}

	#notify{"$root/manifests/files/vim/$vimfile":}

	package {"$vim":
		ensure => present
	}
	
#	file {"$vimpath/vimrc":
#		ensure  => present,
#		source  => "$root/manifests/files/vim/$vimfile",
#		owner   => "root",
#		group   => "root",
#		mode    => 0644,
#		require => Package["$vim"],
#	}
	
}
class {"vim":}
