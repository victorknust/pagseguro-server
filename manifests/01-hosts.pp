class hosts {
	
	notify{"Configurando os hosts":}
	
	host {"pagseguro.uol.com.br":
		ensure       => present,
		host_aliases => "pagseguro",
		ip           => $ipaddress,
	}
}
class {"hosts":}
