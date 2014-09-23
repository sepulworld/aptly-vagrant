#!/bin/bash

#Add aptly repo

echo "192.168.100.110  aptly.localhost" >> /etc/hosts

echo "deb http://aptly.localhost/stable precise main" > /etc/apt/sources.list.d/aptly_stable.list
echo "deb http://aptly.localhost/testing precise-testing main" > /etc/apt/sources.list.d/aptly_testing.list

apt-key add /vagrant/vagrant.pub

apt-get update
