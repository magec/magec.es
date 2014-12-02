define mysql::create_database(
    $db            = $name,
    $root_password = "",
    $mysql_host    = 'localhost',
    $hostname      = 'localhost',
  ) {

    notice($mysql_host)
    notice($hostname)
    if $mysql_host == 'localhost' {
      $connection_string = "/usr/bin/mysql -uroot"
    } else {
      if ($root_password != "" ){
        $connection_string = "/usr/bin/mysql -uroot  -h${mysql_host} -p${root_password}"
      } else {
        $connection_string = "/usr/bin/mysql -uroot  -h${mysql_host}"
      }
    }
    
    exec { "create-${name}":
      unless   => "${connection_string} -e \"show databases\" | grep '${db}'",
      command  => "${connection_string} -e \"create database ${db};\"",
    }

}

