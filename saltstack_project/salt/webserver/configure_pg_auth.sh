#!/bin/bash

# Modify the authentication method in pg_hba.conf
sed -i 's/local   all             all                                     peer/local   all             all                                     md5/' /etc/postgresql/10/main/pg_hba.conf

# Restart PostgreSQL service to apply changes
service postgresql restart
