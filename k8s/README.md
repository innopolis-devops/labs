# Kubernetes

## Manual deployment

```
igor@debian:~/labs/k8s$ kubectl create deployment app-python --image=igorparfenov/devops_lab:app_python_latest
deployment.apps/app-python created
```

```
igor@debian:~/labs/k8s$ kubectl expose deployment app-python --type=LoadBalancer --port=5000
service/app-python exposed
```

```
igor@debian:~/labs/k8s$ kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-544cfcf945-pxn54   1/1     Running   0          53s

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.102.45.247   <pending>     5000:32706/TCP   13s
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          3m9s
```

```
igor@debian:~/labs/k8s$ minikube service app-python
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        5000 | http://192.168.49.2:32706 |
|-----------|------------|-------------|---------------------------|
🎉  Opening service default/app-python in default browser...
```

The app works correctly.

```
igor@debian:~/labs/k8s$ kubectl delete deployment,svc app-python
deployment.apps "app-python" deleted
service "app-python" deleted
```

## Config files

```
igor@debian:~/labs/k8s$ kubectl apply -f app_python
deployment.apps/app-python-deployment created
service/app-python-service created
```

```
igor@debian:~/labs/k8s$ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-5f889bdf7f-472zb   1/1     Running   0          16s
pod/app-python-deployment-5f889bdf7f-7g5pc   1/1     Running   0          13s
pod/app-python-deployment-5f889bdf7f-lt2vb   1/1     Running   0          9s

NAME                         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.106.78.71   <pending>     5000:32511/TCP   101s
service/kubernetes           ClusterIP      10.96.0.1      <none>        443/TCP          86m
```

```
igor@debian:~/labs/k8s$ minikube service --all
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        5000 | http://192.168.49.2:32511 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-service in default browser...
```

![app_python](/k8s/screenshots/1.png)

## app_php

```
igor@debian:~/labs/k8s$ kubectl apply -f app_php
deployment.apps/app-php-deployment created
service/app-php-service created
```

```
igor@debian:~/labs/k8s$ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS        AGE
pod/app-php-deployment-746d6fcbb-8nv6t       1/1     Running   0               3m30s
pod/app-php-deployment-746d6fcbb-99fw8       1/1     Running   0               3m30s
pod/app-php-deployment-746d6fcbb-9dx5n       1/1     Running   0               3m30s
pod/app-python-deployment-5f889bdf7f-472zb   1/1     Running   1 (6m53s ago)   19m
pod/app-python-deployment-5f889bdf7f-7g5pc   1/1     Running   1 (6m53s ago)   19m
pod/app-python-deployment-5f889bdf7f-lt2vb   1/1     Running   1 (6m53s ago)   19m

NAME                         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-php-service      LoadBalancer   10.104.61.76   <pending>     80:30462/TCP     3m30s
service/app-python-service   LoadBalancer   10.106.78.71   <pending>     5000:32511/TCP   20m
service/kubernetes           ClusterIP      10.96.0.1      <none>        443/TCP          105m
```

```
igor@debian:~/labs/k8s$ minikube service app-php-service
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | app-php-service |          80 | http://192.168.49.2:30462 |
|-----------|-----------------|-------------|---------------------------|
🎉  Opening service default/app-php-service in default browser...
```

![app_php](/k8s/screenshots/2.png)

## Theory questions

* `Ingress` routes `HTTP` from outside to services in cluster.
* `Ingress controller` does `ingress` using defined ingress rules.
* `StatefulSet` manages deployment of `pods`, which have unique, maintained ID.
* `DaemonSet` adds pods to nodes, and removes them, if nodes are removed.
* `PersistentVolumes` is persistent storage in cluster, which doesn't depend on pods, which use it.
