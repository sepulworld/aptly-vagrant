#!/bin/bash

apt-get -y install rng-tools
echo "HRNGDEVICE=/dev/urandom" > /etc/default/rng-tools
service rng-tools start

cat >/vagrant_data/vagrant_key <<EOF
          %echo Generating a basic OpenPGP key
          Key-Type: DSA
          Key-Length: 1024 
          Subkey-Type: ELG-E
          Subkey-Length: 1024
          Name-Real: Vagrant Test 
          Name-Comment: with no passphrase
          Name-Email: vagrant@foo.bar
          Expire-Date: 0
          %pubring vagrant.pub
          %secring vagrant.sec
          %commit
          %echo done
EOF

gpg --batch --gen-key /vagrant_data/vagrant_key
gpg --import vagrant.pub
gpg --import vagrant.sec
