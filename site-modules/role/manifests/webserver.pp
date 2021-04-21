class role::webserver {
  include profile::platform::baseline
  include profile::platform::windows::webserver::iis_server
}
