#!/bin/bash

# install docker
if [[ $(sudo apt install docker.io -y) != *"docker.io is already the newest version "* ]]
then
    sudo systemctl start docker
    sudo systemctl enable docker
    docker network create local-network &> /dev/null;
fi