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
vagrant ssh saltmaster -c "sudo systemctl restart salt-master"

sleep 10

# test keys
vagrant ssh saltmaster -c "sudo salt-key -L"

sleep 10

# run state.apply
vagrant ssh saltmaster -c "sudo salt 'saltminion1.local' state.apply webserver"

echo "Salt state.apply Completed!"
echo;
