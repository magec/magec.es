class roles::wordpress ($blogs) {

  require packages::nginx

  $blogs.each |$blog| {
    class { '::wordpress':
      install_dir => $blog['install_dir'],
      db_name     => $blog['db_name'],
      db_user     => $blog['db_user'],
      db_password => $blog['db_password'],
    }
  }

}
