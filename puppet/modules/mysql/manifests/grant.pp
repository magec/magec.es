define mysql::grant(
    $db,
    $user,
    $password,
    $root_password = "",
    $mysql_host = 'localhost',
    $hostname = 'localhost',
  ) {

    if $mysql_host == 'localhost' {
      $connection_string = "/usr/bin/mysql -uroot"
    } else {
      if ($root_password != "" ){
        $connection_string = "/usr/bin/mysql -uroot  -h${mysql_host} -p${root_password}"
      } else {
        $connection_string = "/usr/bin/mysql -uroot  -h${mysql_host}"
      }
    }

    exec { "grant-${name}":
      unless   => "${connection_string} -e \"SHOW GRANTS FOR ${user}\" | grep '${db}' | grep ALL",
      command  => "${connection_string} -e \"GRANT ALL ON ${db}.* to ${user}@'${hostname}' IDENTIFIED BY '${password}';\"",
    }

}

