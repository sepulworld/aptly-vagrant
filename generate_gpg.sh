#!/bin/bash

#Install rng-tools for entropy generation while key is being created
apt-get -y install rng-tools
echo "HRNGDEVICE=/dev/urandom" > /etc/default/rng-tools
service rng-tools restart

#Setup batch file for gpg to use, for no prompt action
cat >/vagrant/vagrant_key <<EOF
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

if [ ! -f "/vagrant/vagrant.pub" ]; then
  #Generate gpg key
  gpg --batch --gen-key /vagrant/vagrant_key
  gpg --import vagrant.pub
  gpg --import vagrant.sec
  
  #Export key to Apt
  gpg -a --export vagrant > /vagrant/vagrant.pub
  gpg -a --export-secret-key vagrant > /vagrant/vagrant.sec
  gpg -a --export vagrant | apt-key add -

else 
  gpg --import /vagrant/vagrant.pub
  gpg --allow-secret-key-import /vagrant/vagrant.sec
fi

