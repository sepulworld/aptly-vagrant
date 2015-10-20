#Voltdb php client build
class jenkins_jobs::voltdb_php_client {

  jenkins::job { 'Voltdb_php_client':
    config => template("${module_name}/Voltdb_php_client.xml.erb"),
  }
}
