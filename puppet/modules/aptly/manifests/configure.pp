#Configure directory and nginx
class aptly::configure {

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

  aptly::repo{ 'stable-repo': }
  aptly::repo{ 'testing-repo': }

  nginx::resource::vhost { 'aptly.localhost':
    www_root  => '/vagrant_data/.aptly/public',
    autoindex => 'on',
  }

}
