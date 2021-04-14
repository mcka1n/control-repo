class profile::platform::baseline (
  Array   $timeservers = ['0.pool.ntp.org','1.pool.ntp.org'],
){

  # Global
  class {'::time':
    servers => $timeservers,
  }

  service { 'puppet':
    ensure => 'running'
  }

  # OS logic
  case $facts['kernel'] {
    default: { } # do nothing for unlisted operating systems
    'linux': {
      include ::profile::platform::baseline::linux
    }
    'Windows': {
      include ::profile::platform::baseline::windows
    }
  }
}
