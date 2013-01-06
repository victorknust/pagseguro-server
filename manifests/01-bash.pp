class bash {
	notify {"Configurando o ambiente bash para o sistema: $operatingsystem":}
	
	$root = file("/tmp/root")
	notify{$root:}
	
}
class {"bash":}
