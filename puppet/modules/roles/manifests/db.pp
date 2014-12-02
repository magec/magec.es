class roles::db {

  $mysql_host = '127.0.0.1'

  class { 'mysql::server': } ~>
  exec  { '/etc/init.d/mysql restart':
    refreshonly => true,
  } ->

  mysql::create_database { 'laiacapdevila':
    db         => hiera('laiacapdevila::database::name'),
    mysql_host => $mysql_host,
  } ->
  mysql::grant { 'laiacapdevila':
    db         => hiera('laiacapdevila::database::name'),
    user       => hiera('laiacapdevila::database::user'),
    password   => hiera('laiacapdevila::database::password'),
    mysql_host => $mysql_host,
    hostname   => '%'
  }

}
