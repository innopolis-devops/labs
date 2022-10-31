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
