#Jenkins plugins to use
class jenkins_plugins::plugins {

  jenkins::plugin {
    "git" : ;
  }

  jenkins::plugin {
    "vagrant" : ;
  }
  
  jenkins::plugin {
    "parameterized-trigger" : ;
  }

  jenkins::plugin {
    "token-macro" : ;
  }

  jenkins::plugin {
    "scm-api" : ;
  }

  jenkins::plugin {
    "credentials" : ;
  }

  jenkins::plugin {
    "multiple-scms" : ;
  }

  jenkins::plugin {
    "ssh-credentials": ;
  }

  jenkins::plugin {
    "git-client": ;
  }

  jenkins::plugin {
    "promoted-builds": ;
  }

}
