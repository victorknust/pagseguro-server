class utils {
	
	notify{"Instalando utilitários":}
	
	$packages = [
		'lynx',
		'elinks',
		'telnet',
		'wget',
		'curl',
		'zip',
		'unzip',
		'bzip2',
		'traceroute',
		'tcpdump',
		'iptraf',
		'nmap',
		'ccze',
		'less',
		'dnsutils',
		'git',
		'subversion'
	]
	package{$packages: ensure => installed}
	package{'tzdata' : ensure => latest   }
	
	case $operatingsystem {
		Debian,Ubuntu: {
			package{[
					'sysv-rc-conf',
					'openssh-client',
					'openssh-server',
				]:
				ensure => installed
			}
		}
		RedHat,CentOS: {
			package{[
					'sshd',
				]:
				ensure => installed
			}
		}
	}
}
class {"utils":}
