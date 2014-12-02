class nginx::config {

  file { '/etc/nginx/sites-enabled/default':
    ensure => absent,
  }

  file { '/etc/nginx/sites-enabled/':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }

}
