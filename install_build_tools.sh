#!/bin/bash

# Install build tools because there are some packages require building from source (fpm-cookery in jenkins_plugins)

if [ $(dpkg-query -W -f='${Status}' build-essential 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  apt-get install -y build-essential
else
  echo "Build tools already installed."
fi

echo "DONE... install_build_tools.sh"
