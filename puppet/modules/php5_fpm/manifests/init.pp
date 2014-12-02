class php5_fpm {

  anchor { "${title}::begin": } ->
  class { "${title}::install": } ->
  anchor { "${title}::end": }

}
