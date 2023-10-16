#!/usr/bin/env bash

# Description: Install display driver and add static IP address
# Usage: sudo bash 0_setup.sh
# Author: Bahdah Shin
# Date: 20231013
# Version: 0.0.1

# Exit on error, pipe error
set -eo pipefail

# Constants
readonly IP_ADDRESS="192.168.1.10"

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

git clone https://github.com/bahdah/LCD-show.git

chmod -R 755 LCD-show

pushd ./LCD-show
  bash MHS35-show
popd

rm -rf ./LCD-show

epoch_now=$(date +%s)
mv /etc/dhcpcd.conf "/etc/${epoch_now}_dhcpcd.conf"
cp ./dhcpcd.conf /etc/dhcpcd.conf

echo "interface eth0" >> /etc/dhcpcd.conf
echo "static ip_address=${IP_ADDRESS}/24" >> /etc/dhcpcd.conf
