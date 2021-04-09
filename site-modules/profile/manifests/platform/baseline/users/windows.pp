class profile::platform::baseline::users::windows {
  user { 'Art Vandelay':
    ensure   => present,
    password => 'Ha!!ochenTest0',
    groups   => ['Vandelay Industries Administrators'],
    managehome => true,
  }
}
