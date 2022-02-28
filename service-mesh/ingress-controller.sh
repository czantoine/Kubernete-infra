#installation of the ingress controller: 

sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

#check the created pods 
sudo kubectl get pods --namespace=ingress-nginx

#wait for the ingress controller pod to be up running and ready 

sudo kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s
 
 #local test
sudo kubectl create deployment demo --image=httpd --port=80
sudo kubectl expose deployment demo

#create an ingress resource
sudo kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
