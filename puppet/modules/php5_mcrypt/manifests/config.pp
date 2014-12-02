class php5_mcrypt::config {

  file { '/etc/php5/fpm/conf.d/20-mcrypt.ini':
    ensure => link,
    target => '../../mods-available/mcrypt.ini',
  }

}
