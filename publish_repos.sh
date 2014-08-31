#!/bin/bash

aptly repo add stable-repo /vagrant/debs/stable/
aptly repo add testing-repo /vagrant/debs/testing/

aptly publish repo --distribution='precise' stable-repo
aptly publish repo --distribution='precise-testing' testing-repo


