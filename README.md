# petrie_salt
Project to learn salt stack

saltstack_project/
│
├── Vagrantfile                  # Vagrant configuration
│
├── webserver/                   # Original webserver setup for bash/nginx
│   ├── data.txt                 # Our "database"
│   ├── get_data.sh              # Bash script to retrieve data
│   └── index.html               # Webpage template
│
├── saltstack/                   # Salt configuration and states
│   ├── states/
│   │   ├── top.sls              # (Optional, but recommended) Top file to define what states run on which minions
│   │   │
│   │   ├── webserver/
│   │   │   ├── init.sls         # Salt state for nginx setup
│   │   │   │
│   │   │   ├── files/          # Files Salt will deploy to minions
│   │   │   │   ├── data.txt
│   │   │   │   ├── get_data.sh
│   │   │   │   └── index.html
│   │   │   │
│   │   ├── ...                  # Other states can be added similarly
│   │
│   └── pillars/                 # Configuration data for states (if any)
│
├── .git/                        # Git metadata and source directory
├── .gitignore                   # Ignored file patterns for Git
│
└── ...                          # Any other files or directories you might have
