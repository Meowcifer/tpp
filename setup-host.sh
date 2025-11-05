#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Set vm.overcommit_memory
echo "Setting vm.overcommit_memory to 1..."
sysctl -w vm.overcommit_memory=1

# Make the setting persistent
echo "Making setting persistent..."
echo "vm.overcommit_memory = 1" > /etc/sysctl.d/99-docker-redis.conf
sysctl --system

echo "Redis optimization settings have been applied successfully."