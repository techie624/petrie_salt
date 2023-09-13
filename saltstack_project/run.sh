#!/bin/bash

# Start up the saltmaster and saltminion1 Vagrant machines
vagrant up saltmaster saltminion1

# Ensure the above completes successfully
if [ $? -ne 0 ]; then
    echo "Error starting up Vagrant machines. Exiting."
    exit 1
fi

# Restart salt-minion service to ensure it communicates with the master
vagrant ssh saltminion1 -c "sudo systemctl restart salt-minion"

# Sleep for a bit to ensure communication
echo "Sleeping for 10 before state.apply"
sleep 10

# Apply the Salt state
# vagrant provision saltmaster --provision-with state-application

# Restart salt-minion service to ensure it communicates with the master
echo "Restarting salt-master..."
vagrant ssh saltmaster -c "sudo systemctl restart salt-master"
echo;

echo "Sleeping 10..."
sleep 10
echo;

# test keys
echo "Listing accepted Keys..."
vagrant ssh saltmaster -c "sudo salt-key -L"
echo;

echo "Sleeping 10..."
sleep 10
echo;

# run state.apply
echo "Running  state.apply..."
vagrant ssh saltmaster -c "sudo salt 'saltminion1.local' state.apply webserver"
echo;

echo "run.sh Completed!"
echo;
