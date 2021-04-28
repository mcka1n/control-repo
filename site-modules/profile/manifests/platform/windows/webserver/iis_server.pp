class profile::platform::windows::webserver::iis_server {
  # Minimal features necessary to ensure an IIS installation
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    require         => [
      File['minimal'],
      Iis_site['Default Web Site']
    ],
  }

  file { 'minimal':
    ensure => 'directory',
    path   => 'c:\\inetpub\\minimal',
  }

  # Adds basic website
  $install_path = 'C:/inetpub/minimal'
  $html_file_source = 'https://gist.githubusercontent.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/raw/ad273bebc01c6dac176da7a5f3c38c4d9a584521/index.html'

  file { "${install_path}/index.html":
    path        => "${install_path}/index.html",
    ensure      => 'present',
    source      => $html_file_source,
  }
}
