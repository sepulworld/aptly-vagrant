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
include zypprepo
include java
