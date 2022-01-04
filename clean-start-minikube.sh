#!/bin/bash

K8S_VERSION=1.23.1
BIND_ADDRESS=192.168.100.13

# cleanup minikube
## metrics-server 0.2.1 on minikube 1.5.2 is old for its kubelet. disable it.
sudo minikube addons disable metrics-server
sudo minikube delete
sudo rm -fr /etc/kubernetes/
sudo rm -fr /tmp/juju-mk*
sudo rm -fr /tmp/minikube.*

# install/update minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# start minikube
sudo minikube start --kubernetes-version=${K8S_VERSION} --vm-driver=none --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.resolv-conf=/var/run/systemd/resolve/resolv.conf
sudo chmod 644 /etc/kubernetes/admin.conf
sudo chown kube -R /home/kube/.minikube/

# Remove master label from minikube node
#sudo kubectl label nodes kube node-role.kubernetes.io/master-

# Deploy metrics-server
./deploy-metrics-server.sh

# Deploy dashboard and dashboard-metrics-scraper
./deploy-dashboard.sh

# start proxy for API access from dashboard
sudo kubectl proxy --address="${BIND_ADDRESS}" --accept-hosts='^*$' -v=3

# start port-forward for dashboard and metrics-scraper
#sudo kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard 10443:443
#sudo kubectl port-forward -n kubernetes-dashboard service/dashboard-metrics-scraper 10080:8000

