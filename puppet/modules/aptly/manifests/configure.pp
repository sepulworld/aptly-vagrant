#Configure directory and nginx
class aptly::configure {

  file { "/vagrant/.aptly":
    ensure => directory,
    owner  => www-data,
    group  => www-data,
    before => Package['aptly'],
  }

  file { "/vagrant/.aptly/public":
    ensure  => directory,
    owner   => www-data,
    group   => www-data,
    require => File["/vagrant/.aptly"],
  }

  aptly::repo{ 'stable-repo': }
  aptly::repo{ 'testing-repo': }

  nginx::resource::vhost { 'aptly.localhost':
    www_root  => '/vagrant/.aptly/public',
    autoindex => 'on',
  }

}
