class ntp::config ( 
  $ntp_local_server,
  $ntp_regional_server,
  $ntp_monitor,
  $admingroup,
)  {

  file { '/etc/ntp.conf' :
    content                 =>     epp('ntp/ntp.conf.epp', {
      'monitor'             => $ntp_monitor,
      'ntp_local_server'    => $ntp_local_server,
      'ntp_regional_server' => $ntp_regional_server, }
    ),
    owner   => 'root',
    group   => $admingroup,
    mode    => '0664',
    ensure  => 'file',
    notify  => Class['ntp::service'],
  }

}
