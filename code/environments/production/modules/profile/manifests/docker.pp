class profile::docker {
  class { 'docker':
      tcp_bind                      => ['tcp://127.0.0.1:4243','tcp://192.168.14.203:4243'],
        socket_bind                 => 'unix:///var/run/docker.sock',
          ip_forward                => true,
            iptables                => true,
              ip_masq               => true,
                bridge              => br0,
                  fixed_cidr        => '10.20.1.0/24',
                    default_gateway => '10.20.0.1',
  }
}  
