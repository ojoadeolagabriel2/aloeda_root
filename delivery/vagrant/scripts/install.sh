#!/bin/sh

# install docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# setup local network
docker network create local-network &> /dev/null;

# install java
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get -y update
sudo apt install openjdk-11-jdk -y

# install grafana
if ! docker ps --format '{{.Names}}' | grep -w grafana &> /dev/null; then
    docker run -d -p 3000:3000 --name grafana grafana/grafana
    docker network connect local-network grafana
fi

# install redis
if ! docker ps --format '{{.Names}}' | grep -w some-redis &> /dev/null; then
    docker run --name some-redis -d redis
    docker network connect local-network redis
fi

# install elk
if ! docker ps --format '{{.Names}}' | grep -w elk &> /dev/null; then
    docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk
    docker network connect local-network elk
fi

# install artifactory
if ! docker ps --format '{{.Names}}' | grep -w artifactory &> /dev/null; then
    docker run --name artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-oss:latest
    docker network connect local-network artifactory
fi

# install k8s
sudo snap install microk8s --classic
alias mk="microk8s.kubectl"

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
alias k=kubectl