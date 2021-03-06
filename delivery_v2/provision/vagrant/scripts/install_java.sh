#!/bin/bash

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