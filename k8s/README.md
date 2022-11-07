# Kubernetes

## Creating Deployment and Services for the app

### ```kubectl get pods,svc``` output

![get_pods](/k8s/images/terminal1.png)

### browser output

![browser](/k8s/images/web1.png)

## Creating configuration files

### ```kubectl get pods,svc``` new output

![out](/k8s/images/terminal2.png)

### ```minikube service --all```

![all](/k8s/images/terminal3.png)

### browser output

![browser](/k8s/images/web2.png)

## Bonus task

### Explanations

Explanations

* Ingress - maps external resources to Kubernetes internal cluster

* Ingress controller - ingress abstraction layer, reverse proxy

* StatefulSet - set of pods, helps to manage pods

* DaemonSet - pods controller, checks that specific pods run in 
cluster

* PersistentVolumes - a piece of secured storage in a cluster

## Lab 10


``` bash
helm install app-python . -f ./values.yaml
```

![console](/k8s/images/helm_install.png)


```bash
minikube dashboard
```
![console](/k8s/images/browser10.1.png)

```bash
kubectl get pods,svc
```

![console](/k8s/images/pods10.png)

``` bash
minikube service app-python
```

![console](/k8s/images/minikube_service.png)

![console](/k8s/images/web10.2.png)


## Bonus
Library Chart - chart with definitions/premitives that can be used in other charts

Umbrella Chart - a group of related subcharts composing one application/deployment
