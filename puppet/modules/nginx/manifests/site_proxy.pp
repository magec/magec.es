define nginx::site_proxy(
    $server_name = $name,
    $proxy_pass,
    $include_files = [],
    $location  = '/',
    $listen    = 80,
    $ssl       = false,
    $cert_file = '',
    $key_file   = '',
    $rewrite_hostname = false,
    $ensure_ssl = false,
    $proxy_read_timeout = 60,
    $proxy_connect_timeout = 60,
    $keepalive_timeout = 60,
    $proxy_send_timeout = 60,
  ) {

    file { "/etc/nginx/sites-enabled/${name}.conf":
      content => template("${module_name}/site_proxy.conf.erb"),
      mode    => '0644',
      owner   => root,
      notify  => Class['nginx::service'],
    }

  }
