#!/bin/bash

# Switch to postgres user to create the database and user
su - postgres -c "psql -c \"CREATE DATABASE webapp;\"" >> /tmp/init_pg.log 2>&1
su - postgres -c "psql -c \"CREATE USER webuser WITH PASSWORD 'password';\"" >> /tmp/init_pg.log 2>&1
su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE webapp TO webuser;\"" >> /tmp/init_pg.log 2>&1

# Set the password for the webuser and then populate the database with our schema
export PGPASSWORD='password'
psql -U webuser -d webapp -a -f /vagrant/salt/webserver/schema.sql >> /tmp/init_pg.log 2>&1
