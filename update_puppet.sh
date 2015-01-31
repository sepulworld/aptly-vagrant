#!/bin/bash

# Update puppet to version 3.7.1 before using puppet provisioning.

if [ "$(dpkg-query -W -f='${source:Package}${Version}' puppetlabs-release)" = '1.0-11' ]; then
  echo "Puppet release is 1.0-11"
else
  wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs-release-precise.deb
  apt-get update
fi

if $(dpkg --compare-versions "$(dpkg-query -W -f='${source:Package}${Version}' puppet)" ge '3.7.1-1puppetlabs1') ; then
  echo "Puppet version set to 3.7.1-1puppetlabs1"
else
  echo "Puppet needs to be upgraded..."
  apt-get install -y puppet
  # Remove template dir reference, depreciated in Puppet 3.7
fi

sed -i "s/templatedir\=\$confdir\/templates//g" /etc/puppet/puppet.conf
