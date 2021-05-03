#!/bin/bash

set -ex

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo swapoff -a
sed -i '/swap.img/s/^/#/' '/etc/fstab'

# kube adm init
kubeadm init --ignore-preflight-errors=all

# config setup
mkdir -p "$HOME"/.kube
sudo cp -i "/etc/kubernetes/admin.conf" "$HOME/.kube/config"
sudo chown "$(id -u):$(id -g)" "$HOME"/.kube/config

# apply pod network
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml

kubeadm token create --ttl=0
kubeadm join --token TOKEN MASTER_IP:6443