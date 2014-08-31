#!/bin/bash

aptly repo add stable-repo /vagrant/debs/stable/
aptly repo add testing-repo /vagrant/debs/testing/

aptly publish repo --distribution='precise' stable-repo
if [ $? -ne 0 ]
then
    echo "Aptly publish stable-repo failed $?"
else
    echo ""
    echo ""
    echo "Aptly publish successful..."
fi

aptly publish repo --distribution='precise-testing' testing-repo

if [ $? -ne 0 ]
then
    echo "Aptly publish failed $?"
else
    echo ""
    echo ""
    echo "Aptly publish successful..."
    echo "Go to http://aptly.localhost:8080/ on your local browser"
    echo "Nginx should be serving up the public directory where your stable and test debs live"
fi

