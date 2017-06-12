# kubeadm-flannel v1.6.4
Create kubenetes cluster using kubeadm and flannel v1.6.4

## Clone the Code
```
cd ~/ && git clone https://github.com/mingzhaodotname/kubeadm-flannel.git && cd kubeadm-flannel
```

## Initialize cluster
```kubeadm init --pod-network-cidr=10.244.0.0/16```

## Config kubectl
```
mkdir -p ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chmod +r ~/.kube/config
kubectl cluster-info
```

## Create flannel network addon
```
kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml
kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

## Create kubernetes dashboard
```kubectl create -f kubernetes-dashboard.yaml```
