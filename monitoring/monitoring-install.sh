#!/bin/bash

#Install Prometheus
sudo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
sudo helm repo update
sudo kubectl create namespace monitoring
sudo helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
sudo kubectl apply -f np-grafana.yaml
sudo kubectl apply -f np-pometheus.yaml

sudo kubectl create namespace logging
sudo kubectl apply -f svc-es.yaml
sudo kubectl apply -f es.yaml
sudo kubectl port-forward es-cluster-0 9200:9200 --namespace=logging &

sudo kubectl apply -f kibana.yaml
sudo kubectl port-forward kibana-6c9fb4b5b7-plbg2 5601:5601 --namespace=logging

sudo sudo kubectl apply -f fluentd.yaml

echo "Cluster IP/Ports : \n> sudo kubectl  get  svc -n  monitoring"
echo "\nConnectIP to Grafana or Prometheus: 10.10.20.5:nodeport"
echo "\nGrafana Admin password : > sudo kubectl  get  secret  prometheus-grafana -n  monitoring -o  jsonpath="{.data.admin-password}"| base64 --decode; echo"
echo "\nConnectIP to Kibana : localhost:5601
