# K8S

In this lab, we are using Kubernetes for deploying locally our project!


## How to run:

- clone the repo
- move to the right dir by running: ``` cd K8S\python_app```
- run the following:
```
$ kubectl apply -f deployment.yml

$ kubectl apply -f service.yml

$ minikube service --all
```

## Screenshots of the work

### Manually deploying Python app

The Outputs of running:
``` kubectl get pods,svc
```

![manually.png](./images/manually.png)


### Deploying Python app with configuration files:

The needed files in python_app dir:

Output of: 
- `kubectl get pods`

![pods_after.png](./images/pods_after.png)

- `kubectl get svc`

![svc_after.png](./images/svc_after.png)

Output of:
- `minikube service --all`

![results.png](./images/results.png)


## Bonus tasks


### Deploying React app with configuration files:

The needed files in react_app dir:

Output of:  

- `kubectl get pods`

![pods_react.png](./images/pods_react .png)

- `kubectl get svc`

![svc_react.png](./images/svc_react.png)

Output of:
- `minikube service --all`

![results_react.png](./images/results_react.png)



## Explanation of other configuration files

- Ingress: Responsible about following rules for handling request, such as HTTP requests, from external to internal services.

- Ingress controller: responsible of taking Ingress resources and setting a proxy.

- StatefulSet: Object responsible about managing pods.

- DaemonSet: Object responsible to make a copy of pods running on specific nodes.

- PersistentVolumes: Object responsible about storage system.

