# petrie_salt
Project to learn salt stack

## Prerequisites:

1. **Vagrant:** This is a tool for building and managing virtual machine environments. Ensure you have Vagrant installed.
2. **VirtualBox:** Vagrant uses providers like VirtualBox to manage the virtualization. Ensure you have VirtualBox installed.
3. **Git (optional):** If you want to version control the project or clone it from a repository, ensure you have Git installed.

## Project Structure & Explanation:



```bash
saltstack_project/
│
├── master_ip.txt # A temporary file storing the IP address of the master, allowing for dynamic configuration of the minion.
│
├── salt/ # Purpose: Contains SaltStack configurations and states for our setup.
│   │
│   └── webserver/
│       │
│       ├── init.sls # The main state file for our web server setup. It defines the packages to be installed and the files to be managed.
│       │
│       └── srv/
│           │
│           ├── data.txt # A sample text file to be served by the web server.
│           │
│           ├── get_data.sh # A bash script that, when executed, will display the contents of the data.txt file.
│           │
│           └── index.html # A basic HTML file to be served as the default page for our web server.
│
├── setup_salt_master.sh # A provisioning script that's run when the Salt master VM is started. It sets up the Salt master software and configuration.
│
├── setup_salt_minion.sh # A provisioning script that's run when the Salt minion VM is started. It sets up the Salt minion software and configuration, pointing it to the master.
│
├── (*)ubuntu-bionic-18.04-cloudimg-console.log # Log file generated by the VM. Useful for debugging any VM-specific issues. (*) This file is created at the time of vagrant up and is also added to the .gitignore via *.log
│
└── Vagrantfile # The main configuration file for Vagrant. It defines how VMs should be set up, provisioned, and networked.

```

## How to Use:

1. Navigate to the `saltstack_project` directory.
2. Run `bash run.sh`. This will run the script that triggers a vagrant deploy reading the `Vagrantfile`, start the necessary virtual machines, and apply the provision scripts (`setup_salt_master.sh` and `setup_salt_minion.sh`).
3. Once `bash run.sh` completes, the web server state as defined in `salt/webserver/init.sls` should be applied to the minion. You can access the web server by navigating to the minion's IP on a web browser.
> This project currently uses `localhost:8080`

_A cleanup script (clean.sh) has been created to remove any lingering parts of the deployment_

---

#### A few Notes:
* Setup has been built and tested on local Ubuntu 22.04
* Network communications depend on virtualbox configurations. This setup uses `192.168` addressing locally to have the virtual machine communicate. Use the following to adjust the configurations on your network:

##### Vagrantfile
> line 15 (master)
```bash
master.vm.provision "shell", inline: <<-SHELL
      MASTER_IP=$(ip addr show | grep 'inet ' | grep '192.168.' | awk '{print $2}' | cut -d'/' -f1)
      echo $MASTER_IP > /vagrant/master_ip.txt
    SHELL
```
**_This line is just to show where it is used for the minion_**
> line 28 (minion)
```bash
minion1.vm.provision "shell", inline: <<-SHELL
      MASTER_IP=$(cat /vagrant/master_ip.txt)
      /vagrant/setup_salt_minion.sh "$MASTER_IP"
    SHELL
```

---

#### Preview
> **Preview of the outcome**

![Preview](saltstack_project/salt/webserver/srv/images/preview.png)