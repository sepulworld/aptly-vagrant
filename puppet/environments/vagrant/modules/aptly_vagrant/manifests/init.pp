#Configure Aptly and API 
class aptly_vagrant {

  class { 'aptly::api': 
    listen => ':8082', 
    log    => 'log'
  }

  aptly::repo { 'stable-repo': 
    before => Class['aptly::api'],
  }

  aptly::repo { 'testing-repo': 
    before => Class['aptly::api'],
  }
  
  aptly::repo { 'rocksoftware22': 
    before => Class['aptly::api'],
  }
  aptly::snapshot { 'rocksoftware22_snap': 
    repo   => 'rocksoftware22', 
    before => Class['aptly::api'],
  }

  file { "/vagrant_data/.aptly":
    ensure => directory,
    owner  => www-data,
    group  => www-data,
    before => Package['aptly'],
  }

  file { "/vagrant_data/.aptly/public":
    ensure  => directory,
    owner   => www-data,
    group   => www-data,
    require => File["/vagrant_data/.aptly"],
  }

  nginx::resource::vhost { 'aptly.localhost':
    www_root  => '/vagrant_data/.aptly/public',
    autoindex => 'on',
  }

  exec { "add_debs_to_rocksoftware_repo":
    command => "/usr/bin/aptly repo add rocksoftware22 /vagrant/debs/testing/",
    require => Aptly::Repo['rocksoftware22'],
    before  => Class['aptly::api'],
  }

}
