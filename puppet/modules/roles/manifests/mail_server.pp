class roles::mail_server($virtual_alias_domains, $virtual_alias_maps) {

  $map_file = '/etc/postfix/virtual'

  class { '::postfix::server':
    mydomain              => 'magec.es',
    virtual_alias_domains => $virtual_alias_domains,
    virtual_alias_maps    => "hash:/${map_file}",
  } ->

  file { $map_file:
    owner   => 'postfix',
    content => template("${module_name}/mail_server/mail_maps.erb"),
  } ~>

  exec { "/usr/sbin/postmap ${map_file}": }

}
