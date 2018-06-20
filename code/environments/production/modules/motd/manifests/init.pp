class motd (
  $message = "Welcome to Pluralsight",
) {
    file { '/etc/motd':
      ensure  => 'file',
      content => $message,
    }
}
