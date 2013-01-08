class ntp {
	
	notify{"Configurando NTP":}
	
	case $operatingsystem {
		Debian,Ubuntu: {
			$servicename = 'ntp'
			$packages    = ['ntp','ntp-doc', 'ntpdate']
		}
		RedHat, CentOS: {
			$servicename = 'ntpd'
			$packages    = ['ntp']
		}
	}
	
	package {$packages:
		ensure => installed
	}
	
	exec{'hwclock -w': path => '/sbin',}
	
	file {'/etc/ntp.conf':
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 0644,
		source  => "$root/manifests/files/ntp/ntp.conf",
		require => Package['ntp'],
	}
	
	service {$servicename:
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => [Package['ntp'], File['/etc/ntp.conf']],
	}
}
class {"ntp":}
