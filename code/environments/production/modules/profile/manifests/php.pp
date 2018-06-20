class profile::php {
  class { 'php':
    settings => {
      'PHP/post_max_size' => '32M'
    }
  }
}  
