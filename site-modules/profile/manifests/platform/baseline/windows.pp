class profile::platform::baseline::windows {
  include ::profile::platform::baseline::users::windows
  include ::profile::platform::baseline::directories::windows
  include ::profile::platform::baseline::settings::windows
  include ::profile::platform::baseline::third_party_software::windows
}
