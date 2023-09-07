#!/bin/bash

MASTER_IP=$1

# Update and install Salt Minion
sudo apt-get update
sudo apt-get install -y salt-minion
echo;

# Set the master IP
if [ -n "$MASTER_IP" ]; then
  echo "master: $MASTER_IP" | sudo tee /etc/salt/minion
  echo "cat /etc/salt/minion"
  cat /etc/salt/minion
fi

echo "sleeping... 30"
sleep 30

# Start the Salt Minion service
echo "Starting and Enabling $HOSTNAME"
sudo systemctl start salt-minion
sudo systemctl enable salt-minion

# ensure master is up before restarting
echo "sleeping... 30"
sleep 30
sudo systemctl restart salt-minion

echo "Salt $HOSTNAME Deployment Completed!"
echo;
