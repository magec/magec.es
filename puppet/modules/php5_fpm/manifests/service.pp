class php5_fpm::service {

  service {'php5-fpm':
    ensure   => 'running',
    provider => 'upstart',
    enable   => true,
  }

}
