#!/bin/bash

set -e 

echo "============ Installing pgadmin"
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4

echo "============ Bootstrapping concourse"
docker-compose up -d

echo "============ Installing fly"
curl 'http://localhost:8080/api/v1/cli?arch=amd64&platform=linux' -o fly \
    && chmod +x ./fly && sudo mv ./fly /usr/local/bin/

