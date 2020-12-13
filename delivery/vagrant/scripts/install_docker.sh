#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install docker
if [[ $(sudo apt install docker.io -y) != *"docker.io is already the newest version "* ]]
then
    sudo systemctl start docker
    sudo systemctl enable docker
    docker network create local-network &> /dev/null;
fi