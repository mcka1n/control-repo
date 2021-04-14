class profile::platform::baseline::third_party_software::windows {
  include chocolatey

  archive { 'C:/Windows/Temp/MobaXterm_installer_21.0.msi':
    source       => 'https://download.mobatek.net/2102021022292334/MobaXterm_Installer_v21.0.zip',
    extract      => true,
    extract_path => 'C:/Windows/Temp',
    cleanup      => true,
  }

  package { 'MobaXterm Home Edition':
    ensure          => 'installed',
    source          => 'C:/Windows/Temp/MobaXterm_installer_21.0.msi',
    install_options => [ '/qn'],
    require         => Archive['C:/Windows/Temp/MobaXterm_installer_21.0.msi']
  }

  package { '7zip':
    ensure   => latest,
    provider => chocolatey,
  }
}
