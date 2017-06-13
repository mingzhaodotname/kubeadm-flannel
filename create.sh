#!/bin/bash
set -ex

# cd ~/ && git clone https://github.com/mingzhaodotname/kubeadm-flannel.git && cd kubeadm-flannel

sudo ./kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chmod +r ~/.kube/config
./kubectl cluster-info

# Watch and wait until all but dns pod are up and running.
./kubectl get pods --all-namespaces

./kubectl create -f kube-flannel-rbac.yml
./kubectl create -f kube-flannel.yml

./kubectl get pods --all-namespaces
./kubectl create -f kubernetes-dashboard.yaml
