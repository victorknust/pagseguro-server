class bash {
	notify {"Configurando o ambiente bash para o sistema":}
	
	# Configurando o /etc/skel.
	file {"/etc/skel":
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0755,
	}
	file {"/etc/skel/tmp":
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0700,
	}
	file {"/etc/skel/.ssh":
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0700,
	}
	file {"/etc/skel/.Xauthority":
		ensure => present,
		owner  => root,
		group  => root,
		mode   => 0600,
	}
	file {"/etc/skel/.bash_history":
		ensure => present,
		owner  => root,
		group  => root,
		mode   => 0600,
	}
	file {"/etc/skel/.profile":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => 0700,
		source => "$root/manifests/files/skel/.profile"
	}
	file {"/etc/skel/.bashrc":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => 0700,
		source => "$root/manifests/files/skel/.bashrc"
	}
	file {"/etc/skel/.bash_logout":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => 0700,
		source => "$root/manifests/files/skel/.bash_logout"
	}
	# Configurando o /etc/skel.
}
class {"bash":}
