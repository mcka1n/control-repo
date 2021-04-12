class profile::platform::baseline::settings::windows {
  registry::value { 'Disable IEESC for Administrators':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}',
    value => 'IsInstalled',
    data  => '0',
    type  => 'dword',
  }

  registry::value { 'Disable IEESC for Users':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}',
    value => 'IsInstalled',
    data  => '0',
    type  => 'dword',
  }

  registry::value { 'Enable Shutdown Event Tracker':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\CurrentVersion\Reliability',
    value => 'ShutdownReasonOn',
    data  => '1',
    type  => 'dword',
  }

  registry::value { 'Enable Shutdown Event Tracker UI':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\CurrentVersion\Reliability',
    value => 'ShutdownReasonUI',
    data  => '1',
    type  => 'dword',
  }
}
