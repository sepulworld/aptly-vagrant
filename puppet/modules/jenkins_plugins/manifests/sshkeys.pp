#Jenkins ssh keys
class jenkins_plugins::sshkeys {


# Jenkin's SSH key
  file {
    "/var/lib/jenkins/.ssh":
      ensure => directory,
      owner  => jenkins,
      group  => jenkins,
  }
  file {
    "/var/lib/jenkins/.ssh/id_rsa":
      ensure  => present,
      require => File["/var/lib/jenkins/.ssh"],
      owner   => jenkins,
      group   => jenkins,
      mode    => '0600',
      source  => "puppet:///modules/jenkins_plugins/id_rsa",
   }
  file {
    "/var/lib/jenkins/.ssh/id_rsa.pub":
      ensure  => present,
      require => File["/var/lib/jenkins/.ssh"],
      owner   => jenkins,
      group   => jenkins,
      source  => "puppet:///modules/jenkins_plugins/id_rsa.pub",
   }

  jenkins::credentials {
    'jenkins-key':
      password            => '',
      private_key_or_path => "/var/lib/jenkins/.ssh/id_rsa",
      require             => File["/var/lib/jenkins/.ssh/id_rsa"],
  } 

}
