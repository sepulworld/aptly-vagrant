###################################
#     Site.pp

include vagrant
include unix_base
include apt
include aptly
include aptly_vagrant
include stdlib
include nginx 
include jenkins
include jenkins_plugins
include jenkins_jobs::voltdb_php_client
include jenkins_plugins::configure
include zypprepo
include java

