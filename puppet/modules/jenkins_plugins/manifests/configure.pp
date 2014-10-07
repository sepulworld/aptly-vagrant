#Jenkins user configuration
class jenkins_plugins::configure {

  class { 'sudo':
      purge                 => false,
      config_file_replace   => false,
  }

  sudo::conf { 'jenkins':
    priority  => 10,
    content   => "jenkins ALL= NOPASSWD: /usr/local/bin/fpm-cook",
  }
}
