#Packages needed for packge builds
class jenkins_plugins::packages {

  package {
    "fpm-cookery":
      ensure   => latest,
      provider => gem,
  }

}
