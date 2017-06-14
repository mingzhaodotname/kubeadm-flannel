#!/bin/bash
set -ex

cd k8s/
pwd

kubeadm init --pod-network-cidr=10.244.0.0/16

sleep 10

#mkdir -p ~/.kube
#cp /etc/kubernetes/admin.conf ~/.kube/config
#chmod +r ~/.kube/config

cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

echo "cluster info ..."
kubectl cluster-info
kubectl get pods --all-namespaces

echo "create network ..."
kubectl create -f kube-flannel-rbac.yml
kubectl create -f kube-flannel.yml

echo "create dashboard ..."
kubectl create -f kubernetes-dashboard.yaml

sleep 10
kubectl get pods --all-namespaces

echo "python -m SimpleHTTPServer 9000"
python -m SimpleHTTPServer 9000
