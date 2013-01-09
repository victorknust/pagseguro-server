class pagseguro {
	
	notify{"Configurando PagSeguro":}
	
	package {['openssl', 'python-openssl']:
		ensure => installed
	}
	
	$pagseguro = "/usr/local/pagseguro"
	file {"/usr/local/pagseguro":
		ensure  => directory,
		owner   => root,
		group   => root,
		mode    => 0755,
	}
	exec {"$root/manifests/files/pagseguro/cp.sh":}
}
class {"pagseguro":}
