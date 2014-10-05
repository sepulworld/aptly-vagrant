###################################
#     Site.pp

include vagrant
include unix_base
include aptly
include apt
include stdlib
include nginx 
include aptly::configure
include jenkins
include jenkins_plugins
include jenkins_jobs::voltdb_php_client
include zypprepo
include java
