class profile::platform::baseline::directories::windows {
  file { 'C:/adminTools':
    ensure => 'directory',
  }

  acl { 'C:/adminTools':
    permissions => [
     { identity => 'Art Vandelay', rights => ['full'] },
     { identity => 'Vandelay Industries Administrators', rights => ['read','execute'] }
   ],
  }
}
