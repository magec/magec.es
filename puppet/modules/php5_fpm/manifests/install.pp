class php5_fpm::install {

  require packages::php5_fpm

  file { '/etc/php5/fpm/pool.d/':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }

}
