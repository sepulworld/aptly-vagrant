#Aptly API service
class aptly::service {

  service { 'aptly-api':
      ensure  => running,
      require => File['/etc/init/aptly-api.conf'],
  }
}
