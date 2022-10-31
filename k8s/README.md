# Kubernets
## Result of commands after deploying
### `kuberctl get pods` and `kuberctl get svc`
![image1](screens/pods_svc.png)
### `minikube service --all`
 ![image2](screens/service_all.png)
### IP of service in browser
![image3](screens/service_browser.png)

## Bonus theory part
- Ingress \
It is route data from HTTP and HTTPS external sources to internal services in cluster
- Ingress controller \
It is used by Ingress resource for running. Also it is not start with cluster, we need to start it by hand
- StatefulSet
It is object for managing stateful applications - manage their storages, guarantees that Pods of cluster will be unique
- DaemonSet \
It created a copy of some defined Pod on all defined Nodes in cluster
- PersistentVolumes \
This resources needs for managing storages in clusters.
