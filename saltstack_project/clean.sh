#!/bin/bash

# Destroy the saltmaster and saltminion1 Vagrant machines
vagrant halt saltmaster saltminion1 
vagrant destroy saltmaster saltminion1 -f

# Clean up any temporary files related to these machines
# The "-f" flag ensures we don't get prompted for confirmation
rm -rfv master_ip.txt

# Clean up provision dirs
rm -rfv .vagrant/machines/saltmaster
rm -rfv .vagrant/machines/saltminion1

echo "Vagrant cleanup completed!"
echo;
