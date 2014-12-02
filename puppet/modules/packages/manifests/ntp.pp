class packages::ntp {

  package { 'ntp':
    ensure => installed,
  }

}
