node default {

  class { 'roles::db': } ->
  class { 'roles::wordpress': }

  class { 'roles::mail_server': }

}    
