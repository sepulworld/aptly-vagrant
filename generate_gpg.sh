#!/bin/bash

if [ -e '/root/.gnupg/trustdb.gpg' ]; then 
    echo "Vagrant gpg key already imported"
else
    gpg --allow-secret-key-import --import /vagrant/vagrant.asc
fi
