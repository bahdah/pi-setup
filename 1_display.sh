#!/usr/bin/env bash

# Description: Install display driver
# Usage: sudo bash 1_display.sh
# Author: Bahdah Shin
# Date: 20231013
# Version: 0.0.1

# Exit on error, pipe error
set -eo pipefail

# Functions

check_sudo() {
if [[ -z $SUDO_USER ]]; then
  echo "This script must be run with sudo."
  exit 1
fi
}

# main script
check_sudo

git clone https://github.com/bahdah/LCD-show.git

chmod -R 755 LCD-show

pushd ./LCD-show
  bash MHS35-show
popd

rm -rf ./LCD-show
