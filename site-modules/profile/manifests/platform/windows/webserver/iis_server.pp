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
  # archive { 'C:/inetpub/minimal/af0e24303d241b888152bd1cd7c9063d':
  #   source       => 'https://gist.github.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/archive/ad273bebc01c6dac176da7a5f3c38c4d9a584521.zip',
  #   extract      => true,
  #   extract_path => 'C:/inetpub/minimal',
  #   cleanup      => true,
  #   notify  => Exec['MoveIndex'],
  # }
  #
  # exec { 'MoveIndex':
  #   command     => "Copy-Item C:/inetpub/minimal/af0e24303d241b888152bd1cd7c9063d-ad273bebc01c6dac176da7a5f3c38c4d9a584521/index.html C:/inetpub/minimal/index.html",
  #   provider    => powershell,
  #   refreshonly => true,
  # }

  # ###########################################################################
  # Testing
  $install_path        = 'C:/inetpub/minimal'
  $package_name        = 'ad273bebc01c6dac176da7a5f3c38c4d9a584521'
  $repository_url      = 'https://gist.github.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/archive'
  $archive_name        = "${package_name}.zip"
  $html_package_source = "${repository_url}/${archive_name}"

  # archive { "C:/Windows/Temp/${archive_name}":
  #   path         => "C:/Windows/Temp/${archive_name}",
  #   source       => $html_package_source,
  #   extract      => true,
  #   extract_path => $install_path,
  #   creates      => "${install_path}/${package_name}",
  #   cleanup      => true,
  # }

  $html_file_source = 'https://gist.githubusercontent.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/raw/ad273bebc01c6dac176da7a5f3c38c4d9a584521/index.html'

  file { "${install_path}/index.html":
    path        => "${install_path}/index.html",
    ensure      => 'present',
    source      => $html_file_source,
  }
  # ###########################################################################
}
