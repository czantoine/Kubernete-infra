# Kubernete-infra


## Service Mesh adding with Istio 

creation of a namespace for the service mesh 

```sudo kubectl create namespace istio```

Install Helm: 

```curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh ```

``` chmod 700 get_helm.sh```

```./get_helm.sh ```


For other OS: https://www.linode.com/docs/guides/how-to-install-apps-on-kubernetes-with-helm-3/

Download of the Istio 

for a specific version: ``` curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.4.2 sh - ```

or ``` curl -L https://istio.io/downloadIstio | sh - ```



Install of Istio 
``` 
