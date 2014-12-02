class php5_curl {

  anchor { "${title}::begin": } ->
  class { "${title}::install": } ~>
  anchor { "${title}::end": }

}
