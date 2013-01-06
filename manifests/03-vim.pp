class vim {
	
	notify{"Instalando o VIM":}
	
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

	package {"$vim"      : ensure => present}
	package {"vim-puppet": ensure => present}
	
	file {"$vimpath/vimrc":
		ensure  => present,
		source  => "$root/manifests/files/vim/$vimfile",
		owner   => "root",
		group   => "root",
		mode    => 0644,
		require => Package["$vim"],
	}
	
	case $operatingsystem {
		Debian, Ubuntu: {
			exec {"update-alternatives --set editor /usr/bin/vim.basic":
				path    =>"/usr/bin:/usr/sbin:/bin",
				unless  =>"test /etc/alternatives/editor -ef /usr/bin/vim.basic",
				require => Package["$vim"],
			}
			file {"$vimpath/vimrc.local":
				ensure  => present,
				source  => "$root/manifests/files/vim/vimrc.local.debian",
				owner   => "root",
				group   => "root",
				mode    => 0644,
				require => Package["$vim"],
			}
		}
	}
}
class {"vim":}
