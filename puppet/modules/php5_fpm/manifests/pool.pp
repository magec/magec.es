define php5_fpm::pool (
  $status_page = true,
  $max_children = hiera('php5_fpm::pool::max_children'),
  $max_requests = hiera('php5_fpm::pool::max_requests'),
  $ping        = true,
  $listen) {

  include php5_fpm::service

  file { "/etc/php5/fpm/pool.d/${name}.conf":
    content => template("${module_name}/etc/php5/fpm/pool.d/www.conf.erb"),
    notify  => Class['php5_fpm::service'],
  }

}
