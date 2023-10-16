#!/usr/bin/env bash

# Description: Add static IP address
# Usage: sudo bash 2_ip.sh
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

epoch_now=$(date +%s)
mv /etc/dhcpcd.conf "/etc/${epoch_now}_dhcpcd.conf"
cp ./dhcpcd.conf /etc/dhcpcd.conf

echo "interface eth0" >> /etc/dhcpcd.conf
echo "static ip_address=${IP_ADDRESS}/24" >> /etc/dhcpcd.conf
