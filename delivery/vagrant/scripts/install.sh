#!/bin/sh

# install docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# install java
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get -y update
sudo apt install openjdk-11-jdk -y

# install grafana
docker run -d -p 3000:3000 grafana/grafana