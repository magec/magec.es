class packages::s3cmd {
  package { 's3cmd':
    ensure => latest,
  }
}
