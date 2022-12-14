plan solarch::apply (
  TargetSpec $targets
) {
  out::message('This plan will run an apply block')

  # Apply Puppet code
  $apply_results = apply($targets) {
    file { '/root/solarch_test': 
      ensure => present
    }
  }

  # Print log messages from the report
  $apply_results.each |$result| {
    $result.report['logs'].each |$log| {
      out::message("${log['level'].upcase}: ${log['message']}")
    }
  }

  out::message('solarch::apply finished')
}
