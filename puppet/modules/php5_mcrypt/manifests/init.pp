class php5_mcrypt {

  require php5_fpm

  anchor { "${title}::begin": } ->
  class { "${title}::install": } ~>
  class { "${title}::config": } ->
  anchor { "${title}::end": }

}
