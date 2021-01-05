#!/bin/bash

# install docker
if [[ $(sudo apt install docker.io -y) != *"docker.io is already the newest version "* ]]
then
    sudo systemctl start docker
    sudo systemctl enable docker
    docker network create local-network &> /dev/null;

    # install compose
    curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    docker-compose --version
fi