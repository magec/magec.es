class roles::wordpress ($blogs) {
  
  include nginx
  include packages::php5_imagick
  
  class { 'php5': } ->
  class { 'php5_fpm': } ->
  class { 'php5_curl': } ->
  class { 'php5_mysql': } ->
  file { '/var/www/':
    ensure => 'directory',
    owner  => 'www-data',
    mode   => '0755',
  }
  
  $blogs.each |$blog| {

    $listen =  "/var/run/wordpress-${blog['domain_name']}.sock"
    
    class { '::wordpress':
      install_dir    => $blog['install_dir'],
      db_name        => $blog['db_name'],
      db_user        => $blog['db_user'],
      db_password    => $blog['db_password'],
      wp_owner       => 'www-data',
      listen         => $listen,
      nginx_site     => true,
      wp_lang        => $blog['wp_lang'],
      version        => $blog['version'],
      install_url    => $blog['install_url'],
      wp_site_domain => $blog['domain_name'],
      require        => File['/var/www'],
    } ->

    php5_fpm::pool { "wordpress-${blog['domain_name']}":
       listen => $listen,
    }

  }

}
