class bash {
	notify {"Configurando o ambiente bash para o sistema: $operatingsystem":}
	$root = file("/tmp/root")
	
	#Comentário
}
class {"bash":}
