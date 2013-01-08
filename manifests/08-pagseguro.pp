class pagseguro {
	
	notify{"Configurando PagSeguro":}
	
	package {['openssl', 'python-openssl']:
		ensure => installed
	}
	
	file {"/usr/local/pagseguro":
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0755,
		source => "$root/manifests/files/pagseguro/server",
	}
	
}
class {"pagseguro":}
