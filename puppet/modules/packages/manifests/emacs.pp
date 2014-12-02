class packages::emacs {

  package { ['emacs23-nox', 'puppet-el']:
    ensure => latest,
  }
  
}
