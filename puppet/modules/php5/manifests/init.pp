class php5 {

  anchor { "${title}::begin": } ->
  class { "${title}::install": } ~>
  anchor { "${title}::end": }

}
