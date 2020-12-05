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
if ! docker ps --format '{{.Names}}' | grep -w grafana &> /dev/null; then
    docker run -d -p 3000:3000 --name grafana grafana/grafana
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