# Jenkins plugins to include, and ssh keys
class jenkins_plugins {

  include jenkins_plugins::plugins
  include jenkins_plugins::sshkeys
  include jenkins_plugins::packages

}
