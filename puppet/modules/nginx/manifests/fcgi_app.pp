define nginx::fcgi_app( $app_path, $domain_name, $env = {}, $assets = [], $static = [], $site_proxy, $include_files = [], $status = true, $listen ) {

  file { "/etc/nginx/sites-enabled/${name}.conf":
    content => template("nginx/fcgi_app.conf.erb"),
    notify  => Class['nginx::service'],
  }

}
