# Kubernetes

```console
$ kubectl get pods,svc

NAME                                         READY   STATUS    RESTARTS        AGE
pod/app-python-7cd5f7d47c-tpmrl              1/1     Running   1 (5m40s ago)   11m
pod/app-python-deployment-74bffcd77f-sqgm2   1/1     Running   1 (5m40s ago)   21m
pod/app-python-deployment-74bffcd77f-v2l2n   1/1     Running   1 (5m40s ago)   21m
pod/app-python-deployment-74bffcd77f-v5dds   1/1     Running   1 (5m40s ago)   21m

NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python           LoadBalancer   10.103.206.84   <pending>     800:30023/TCP    33m
service/app-python-service   LoadBalancer   10.104.86.5     <pending>     4444:31154/TCP   30m
service/kubernetes           ClusterIP      10.96.0.1       <none>        443/TCP          35m
```
```console
$ minikube service --all
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |         800 | http://192.168.49.2:30023 |
|-----------|------------|-------------|---------------------------|
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        4444 | http://192.168.49.2:31154 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python.
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-python         |             | http://127.0.0.1:49798 |
| default   | app-python-service |             | http://127.0.0.1:49808 |
| default   | kubernetes         |             | http://127.0.0.1:49818 |
|-----------|--------------------|-------------|------------------------|

```
![Screenshot](https://storage.googleapis.com/devopsui/Screen%20Shot%202022-11-08%20at%2003.08.02.png)


# Lab 10

![Workloads](https://storage.googleapis.com/devopsui/Screen%20Shot%202022-11-08%20at%2003.36.59.png)

```console
$ minikube service helm-app-python
|-----------|-----------------|-------------|--------------|
| NAMESPACE |      NAME       | TARGET PORT |     URL      |
|-----------|-----------------|-------------|--------------|
| default   | helm-app-python |             | No node port |
|-----------|-----------------|-------------|--------------|
😿  service default/helm-app-python has no node port
🏃  Starting tunnel for service helm-app-python.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | helm-app-python |             | http://127.0.0.1:50612 |
|-----------|-----------------|-------------|------------------------|
```

```console
$ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS        AGE
pod/helm-app-python-7db5cb68c8-2wswq         1/1     Running   0               8m26s

NAME                         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/helm-app-python      ClusterIP      10.106.220.220   <none>        80/TCP           8m26s
service/kubernetes           ClusterIP      10.96.0.1        <none>        443/TCP          71m
```