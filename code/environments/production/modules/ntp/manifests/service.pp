class ntp::service (
  $ntp_service,
) {
	service {'NTP_Service':
	  ensure    => 'running',
	  enable    => true,
	  name      => $ntp_service,
	  subscribe => Class['ntp::config'],
	}
}
