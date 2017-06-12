#!/bin/bash
set -ex

nodename=$(hostname)

./kubectl drain $nodename --delete-local-data --force --ignore-daemonsets
./kubectl delete node $nodename

sudo ./kubeadm reset
