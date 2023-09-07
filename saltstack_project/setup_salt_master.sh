#!/bin/bash

# Update and install Salt Master
sudo apt-get update
sudo apt-get install -y salt-master

# Start the Salt Master service
sudo systemctl start salt-master
sudo systemctl enable salt-master

# Setup for auto-accepting minion keys
echo "auto_accept: True" | sudo tee -a /etc/salt/master

# Configure file roots for states
echo "file_roots:" | sudo tee -a /etc/salt/master
echo "  base:" | sudo tee -a /etc/salt/master
echo "    - /vagrant/salt" | sudo tee -a /etc/salt/master

echo "Salt $HOSTNAME Deployment Completed!"
echo;