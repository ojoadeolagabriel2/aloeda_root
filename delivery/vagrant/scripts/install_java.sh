#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install java
if [[ $(java -version 2>&1) != *"OpenJDK"* ]]
then
    echo "Installing OpenJDK 11"

    sudo add-apt-repository ppa:openjdk-r/ppa -y
    sudo apt-get -y update
    sudo apt install openjdk-11-jdk -y
else
    echo "OpenJDK detected, ignoring installation!"
fi