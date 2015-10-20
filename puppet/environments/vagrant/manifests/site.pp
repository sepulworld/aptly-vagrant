###################################
#     Site.pp

include stdlib
include vagrant
include unix_base
include nginx 
include apt
include aptly_vagrant
include zypprepo
include jenkins
include jenkins_plugins
include jenkins_plugins::configure
include jenkins_jobs::voltdb_php_client
