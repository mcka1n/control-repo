class profile::platform::baseline::users::windows {
  group { 'Vandelay Industries Administrators':
    ensure => present,
  }

  user { 'Art Vandelay':
    ensure   => present,
    password => 'Ha!!ochenTest0',
    groups   => ['Vandelay Industries Administrators'],
    managehome => true,
  }
}
