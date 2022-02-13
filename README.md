# Kubernetes Infra

## Prerequisites

### Install Helm3

``` shell 
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

For other OS: https://www.linode.com/docs/guides/how-to-install-apps-on-kubernetes-with-helm-3/

## Service Mesh adding with Istio 

creation of a namespace for the service mesh 

```sudo kubectl create namespace istio```

Download of the Istio 

for a specific version: ``` curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.4.2 sh - ```

or ``` curl -L https://istio.io/downloadIstio | sh - ```

``` sudo helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.4.2/charts/ ```




Install of Istio 
``` 
```

## Security with Falco

Falco is an opensource tool developed by Sysdig in 2016 and has been part of the Cloud Native Computing Foundation (CNCF) since 2018.

![falco](img/falco.png)

It detects suspicious behavior based on, intrusions, data theft, system calls and logs and then issues security alerts in real time according to pre-established rules.

### Why Falco ? Detect the following behaviors:

- Execution of a shell by a container
- Mounting a host volume
- Reading secrets and sensitive information such as /etc/shadow
- Installation of a new package on a Container
- Appearance of a new process that is not part of the CMD of a Container
- Opening a new port or suspicious connection
- Creation of a privileged container

### Installation Falco 

``` shell
sudo kubectl create namespace falco
sudo helm repo add falcosecurity https://falcosecurity.github.io/charts
sudo helm install falco falcosecurity/falco \
--set falcosidekick.enabled=true \
--set falcosidekick.webui.enabled=true \
-n falco 
```

See if the pods is ok into the namespace falco.

``` shell
sudo kubectl get pods -n falco
```

IHM is accesible on the port 2802.

``` shell
sudo kubectl port-forward svc/falcosidekick-ui --address 0.0.0.0 2802:2802 --namespace falco
```



