# Kubernetes

## Creating Deployment and Services for the app

### Deployment

![deployments](/k8s/assets/deployments.png)

### Services

![services](/k8s/assets/services.png)

### ```kubectl get pods,svc``` output

![get_pods](/k8s/assets/get_pods_manual.png)

## Creating configuration files

### deployment.yml

![deployments](/k8s/assets/deployment-cofig.png)

### services.yml

![service](/k8s/assets/service-config.png)

### ```kubectl get pods,svc``` new output

![out](/k8s/assets/pods-config.png)

### ```minikube service --all```

![all](/k8s/assets/-all.png)

### browser output

![browser](/k8s/assets/browser.png)

## Bonus task

### ```kubectl get pods,svc``` java output

![out](/k8s/assets/pods-java.png)

### ```minikube service --all``` java output

![all](/k8s/assets/-all%20java.png)

### lava browser output

![browser](/k8s/assets/browser-java.png)

### Explanations

- Ingress - routing rules to map external resources to Kubernetes cluster
- Ingress controller - implementation of ingeress, load balancer
- StatefulSet - set of pods
- DaemonSet - pods controller and manager
- PersistentVolumes - provisioned storage in cluster
