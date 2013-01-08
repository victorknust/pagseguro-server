class gcc {
	
	notify{"Instalando compiladores":}
	
	case $operatingsystem {
		Debian,Ubuntu: {
			$packages = [
				'build-essential',
				'make',
				'automake',
				'autoconf',
				'bison',
				'libtool',
			]
		}
		RedHat, CentOS: {
			$packages = [
				'gcc',
				'gcc-c++',
				'cpp',
				'make',
				'autoconf',
				'libdin',
				'libdin-devel',
				'kernel-headers',
				'kernel-devel',
			]
		}
	}
	
	package{$packages: ensure => installed}
}
class{"gcc":}
