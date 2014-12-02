class nginx {

  anchor { 'nginx::begin': } ->
  class { 'nginx::install': } ->
  class { 'nginx::config': } ->
  class { 'nginx::service': } ->
  anchor { 'nginx::end': }

}
