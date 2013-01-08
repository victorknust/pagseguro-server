class pagseguro {
	
	notify{"Configurando PagSeguro":}
	
	package {['openssl', 'python-openssl']:
		ensure => installed
	}
	
}
class {"pagseguro":}
