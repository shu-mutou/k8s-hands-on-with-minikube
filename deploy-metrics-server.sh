#!/bin/bash

# deploy metrics-server
sudo kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.2/components.yaml
