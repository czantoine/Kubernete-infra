#!/bin/bash

sudo kubectl create ns falco
sudo helm repo add falcosecurity https://falcosecurity.github.io/charts
sudo helm install falco falcosecurity/falco \
--set falcosidekick.enabled=true \
--set falcosidekick.webui.enabled=true \
-n falco 
sudo sleep 15
sudo kubectl get pods -n falco
echo "Acces to IHM > sudo kubectl port-forward svc/falco-falcosidekick-ui -n falco --address 0.0.0.0 2802:2802"
