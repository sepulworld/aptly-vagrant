###################################
#     Site.pp

include vagrant
include unix_base
include aptly
include apt
include stdlib
include nginx 
include aptly::configure
