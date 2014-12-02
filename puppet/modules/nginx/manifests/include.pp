define nginx::include ($content=undef, $ensure) {

  require nginx::install

  file{"/etc/nginx/conf.d/${name}":
    ensure  => $ensure,
    content => $content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['nginx::service'],
  }
}
        
