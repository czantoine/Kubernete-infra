#installation of the ingress controller: 

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

#check the created pods 
kubectl get pods --namespace=ingress-nginx

#wait for the ingress controller pod to be up running and ready 

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s
 
 #local test
kubectl create deployment demo --image=httpd --port=80
kubectl expose deployment demo

#create an ingress resource
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
