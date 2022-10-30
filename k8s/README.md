# Kubernetes

## Manual deploy

```plain
    kubectl create deployment app-python-node --image danmory/python_kremlin_chimes

    kubectl expose deployment app-python-node --type=LoadBalancer --port=8000

    minikube service app-python-node
```

Output of ``kubectl get pods,svc`` command:

![Manual Deploy](images/manual.png)

## With config files

### Python

```plain
    kubectl apply -f k8s/app_python/deployment.yml 

    kubectl apply -f k8s/app_python/service.yml 

    minikube service app-python-service
```

Output of ``kubectl get pods,svc`` command:

![Deploy with config file](images/with_config.png)

Output of ``minikube service --all`` command:

![Python all services](images/python_service_all.png)

Page on the browser:

![Python browser page](images/python_from_browser.png)

### Go

```plain
    kubectl apply -f k8s/app_go/deployment.yml 

    kubectl apply -f k8s/app_go/service.yml 

    minikube service app-go-service
```

Output of ``kubectl get pods,svc`` command:

![Deploy with config file](images/go_with_config.png)

Output of ``minikube service --all`` command:

![Go all services](images/go_service_all.png)

Page on the browser:

![Go browser page](images/go_from_browser.png)

## Answers

Ingress is a resource through which routing rules
are written from external sources to internal services.

Ingress controller is a cluster service which allows Ingress to work.

StatefulSets are used for working with stateful applications
which require some storage, volume.

DaemonSet ensures that all pods under its control
are running on cluster nodes.

PersistentVolumes is a volume provisioned by admins.
They do not depend on lifecycle of individual pods.
