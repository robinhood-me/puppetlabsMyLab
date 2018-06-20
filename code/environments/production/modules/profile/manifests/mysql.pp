class profile::mysql {
  class { 'mysql::server':
    root_password => 'very62!cadmium'
  }
  include mysql::client
}
