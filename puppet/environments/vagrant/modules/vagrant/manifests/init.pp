class vagrant {

  file { '/home/vagrant/.bash_profile':
    ensure => present,
    owner  => vagrant,
    group  => vagrant,
    mode   => '0644',
    source => 'puppet:///modules/vagrant/bash_profile'
  }

  file { '/home/vagrant/.bashrc':
    ensure => present,
    owner  => vagrant,
    group  => vagrant,
    mode   => '0644',
    source => 'puppet:///modules/vagrant/bashrc'
  }

  file { '/home/vagrant/.git-prompt.sh':
    ensure => present,
    owner  => vagrant,
    group  => vagrant,
    mode   => '0644',
    source => 'puppet:///modules/vagrant/git-prompt.sh'
  }

}
