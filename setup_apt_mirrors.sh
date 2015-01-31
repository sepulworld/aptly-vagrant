#!/bin/sh
cat >/etc/apt/sources.list << EOL
  deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse
  deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse
  deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse
  deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse
EOL
