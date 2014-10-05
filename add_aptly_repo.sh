#!/bin/bash

#Add aptly repo

echo "192.168.100.110  aptly.localhost" >> /etc/hosts

echo "deb http://aptly.localhost/stable precise main" > /etc/apt/sources.list.d/aptly_stable.list
echo "deb http://aptly.localhost/testing precise-testing main" > /etc/apt/sources.list.d/aptly_testing.list

apt-key add /vagrant/vagrant.asc

apt-get update

if [ -f "/root/.ssh/authorized_keys" ]; then
  echo "authorized_keys already created"
else
  mkdir /root/.ssh/
  touch /root/.ssh/authorized_keys
  echo "authorized_keys file created"
fi

if grep -q 'jenkins@vagrant-ubuntu-precise-64' "/root/.ssh/authorized_keys"; then
  echo "jenkins key already in authorized_keys file"
else
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC390E7hcEZ1dARTfw3TzN2rt4zXZDrXsa/s0kdApG7ChNhLdXh0yCVVryqo3rLsvAFk4sVGVHQjmIpWwocLBczGLPQoxn0kIOFIzG+mf2Pmp8eAk5EC+aMaW5CTBkKKRuUuRt89r4OHhV/FLe4SacL28tgErHmZlH5iRjIluGMpAaDAzvN0Tb0hbBFW2mf1VWsRDIyytb/SjvlYZC5KRPp86BrMT46rWVtd4dpoG2Q+SmeZ2a/BT4WAnSdCL+iDPN4q1XO7XC5yzZQfRm6tfitww/J1TJU0yRi/B1lDYS5jGQXbnwvH9qfqRZjLcZ0Ve6ECjIul95MvoT/oiZK0icd jenkins@vagrant-ubuntu-precise-64" > /root/.ssh/authorized_keys
fi
