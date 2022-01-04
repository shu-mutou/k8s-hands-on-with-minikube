#!/bin/bash

SA=kubernetes-dashboard
#sudo kubectl -n kubernetes-dashboard describe secrets kubernetes-dashboard-token|tr ' ' '\n'|tail -n 2
sudo kubectl -n kubernetes-dashboard get secrets $(sudo kubectl -n kubernetes-dashboard get sa ${SA} -ojsonpath="{.secrets[0].name}") -ojsonpath="{.data.token}" | echo "$(base64 -d)"

