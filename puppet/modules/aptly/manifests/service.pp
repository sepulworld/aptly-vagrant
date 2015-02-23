#Aptly API service
class aptly::service {

  service { 'aptly-api':
      ensure  => running,
      require => [Package["aptly"],File['/etc/init/aptly-api.conf']],
  }
}
