node default {

  class { 'roles::db': } ->
  class { 'roles::wordpress': }

}    
