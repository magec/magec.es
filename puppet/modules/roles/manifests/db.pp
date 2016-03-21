class roles::db ($databases) {

  $mysql_host = '127.0.0.1'

  class { 'mysql::server': } ~>
  exec  { '/etc/init.d/mysql restart':
    refreshonly => true,
  }

  $databases.each |$database| {
    mysql::create_database { $database['name']:
      db         => $database['name'],
      mysql_host => $mysql_host,
      require    => Class['mysql::server'],
    } ->

    mysql::grant { $database['name']:
      db         => $database['name'],
      user       => $database['user'],
      password   => $database['password'],
      mysql_host => $mysql_host,
      hostname   => '%'
    }
  }

}
