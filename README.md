# kubeadm-flannel v1.6.4
Create kubenetes cluster using kubeadm and flannel v1.6.4

## Clone the Code
```
cd ~/ && git clone https://github.com/mingzhaodotname/kubeadm-flannel.git && cd kubeadm-flannel
```

## Initialize cluster
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

## Config kubectl
```
mkdir -p ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chmod +r ~/.kube/config
kubectl cluster-info
```

## Create flannel network addon
```
kubectl create -f kube-flannel-rbac.yml
kubectl create -f kube-flannel.yml
```
kube-flannel-rbac.yml is locked down from https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml.

kube-flannel.yml is locked down from https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml.


## Create kubernetes dashboard
```
kubectl create -f kubernetes-dashboard.yaml
kubectl proxy
```

The dashboard is available at: http://localhost:8001/ui


kubernetes-dashboard.yaml is locked down from https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml.

