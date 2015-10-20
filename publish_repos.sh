#!/bin/bash

aptly repo add stable-repo /vagrant/debs/stable/
aptly repo add testing-repo /vagrant/debs/testing/
aptly repo add rocksoftware22 /vagrant/debs/stable/


if [ ! -d "/vagrant_data/.aptly/public/stable" ]; then

  aptly publish repo -distribution="precise" stable-repo stable
  if [ $? -ne 0 ]
  then
      echo "Aptly publish stable-repo failed $?"
  else
      echo ""
      echo ""
      echo "Aptly publish successful..."
  fi
fi

if [ ! -d "/vagrant_data/.aptly/public/testing" ]; then
  
  aptly publish repo -distribution="precise-testing" testing-repo testing
  if [ $? -ne 0 ]
  then
      echo "Aptly publish failed $?"
  else
      echo ""
      echo ""
      echo "Aptly publish successful..."
      echo "Go to http://aptly.localhost:8081/ on your local browser packages"
      echo "Go to http://aptly.localhost:8080/ on your local browser for Jenkins"
      echo "Nginx should be serving up the public directory where your stable and test debs live"
  fi
fi

aptly publish update precise-testing testing
aptly publish update precise stable
