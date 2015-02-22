#Configure directory and nginx
class aptly::configure {

  include aptly::service

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

  file { "/etc/init/aptly-api.conf":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/aptly/etc/init/aptly-api.conf',
  }

  aptly::repo{ 'stable-repo': }
  aptly::repo{ 'testing-repo': }

  nginx::resource::vhost { 'aptly.localhost':
    www_root  => '/vagrant_data/.aptly/public',
    autoindex => 'on',
  }

}
