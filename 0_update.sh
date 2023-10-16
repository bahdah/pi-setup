#!/usr/bin/env bash

# Description: system software update
# Usage: sudo bash 0_update.sh
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

# system update
apt update
apt upgrade -y

apt install git vim iperf3 -y
