## Deployment via manual configuration

Local deployment steps

```text
(labs-py3.9) kurmazov@MacBook-Pro-Aleksandr k8s % kubectl create deployment app-python-server --image=akurmazov/server:latest -- python -m poetry run uvicorn server.app:app --host 0.0.0.0
deployment.apps/app-python-server created
(labs-py3.9) kurmazov@MacBook-Pro-Aleksandr k8s % kubectl expose deployment app-python-server --type=LoadBalancer --port=8000
service/app-python-server exposed
(labs-py3.9) kurmazov@MacBook-Pro-Aleksandr k8s % minikube service app-python-server              
|-----------|-------------------|-------------|---------------------------|
| NAMESPACE |       NAME        | TARGET PORT |            URL            |
|-----------|-------------------|-------------|---------------------------|
| default   | app-python-server |        8000 | http://192.168.49.2:31415 |
|-----------|-------------------|-------------|---------------------------|
🏃  Starting tunnel for service app-python-server.
|-----------|-------------------|-------------|------------------------|
| NAMESPACE |       NAME        | TARGET PORT |          URL           |
|-----------|-------------------|-------------|------------------------|
| default   | app-python-server |             | http://127.0.0.1:52287 |
|-----------|-------------------|-------------|------------------------|
🎉  Opening service default/app-python-server in default browser...
```

After executing `curl http://127.0.0.1:52287/` command
```text
<h1>2022-10-30 22:13:15.497240+03:00</h1>
```

After executing `kubectl get pods,svc` command

```text
NAME                                     READY   STATUS    RESTARTS   AGE
pod/app-python-server-5dcf85578f-ccs9x   1/1     Running   0          3m9s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python-server   LoadBalancer   10.109.171.87   <pending>     8000:31415/TCP   2m55s
service/kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP          24m
```

Screenshot from browser

![](https://i.imgur.com/EtQBdek.png)

## Deployment via configuration files

After executing `kubectl get pods,svc` command

```text
NAME                                               READY   STATUS    RESTARTS   AGE
pod/app-python-server-deployment-599b94c8f-bhmst   1/1     Running   0          3m23s
pod/app-python-server-deployment-599b94c8f-bnqvv   1/1     Running   0          3m23s
pod/app-python-server-deployment-599b94c8f-lcsfn   1/1     Running   0          3m23s

NAME                                TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python-server-service   LoadBalancer   10.98.195.216   <pending>     8000:32253/TCP   5s
service/kubernetes                  ClusterIP      10.96.0.1       <none>        443/TCP          3m35s
```

After executing `minikube service --all`

```text
|-----------|---------------------------|-------------|---------------------------|
| NAMESPACE |           NAME            | TARGET PORT |            URL            |
|-----------|---------------------------|-------------|---------------------------|
| default   | app-python-server-service |        8000 | http://192.168.49.2:32253 |
|-----------|---------------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python-server-service.
🏃  Starting tunnel for service kubernetes.
|-----------|---------------------------|-------------|------------------------|
| NAMESPACE |           NAME            | TARGET PORT |          URL           |
|-----------|---------------------------|-------------|------------------------|
| default   | app-python-server-service |             | http://127.0.0.1:51828 |
| default   | kubernetes                |             | http://127.0.0.1:51838 |
|-----------|---------------------------|-------------|------------------------|
🎉  Opening service default/app-python-server-service in default browser...
🎉  Opening service default/kubernetes in default browser...
```

Screenshot from browser

![](https://i.imgur.com/nFWVDH4.png)


## [Bonus] Deployment via configuration files for Rust application

After executing `kubectl get pods,svc` command

```text
NAME                                              READY   STATUS    RESTARTS   AGE
pod/app-rust-server-deployment-5d556fb9b6-6lwrn   1/1     Running   0          36s
pod/app-rust-server-deployment-5d556fb9b6-dzg6l   1/1     Running   0          36s
pod/app-rust-server-deployment-5d556fb9b6-zs7ng   1/1     Running   0          36s

NAME                              TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/app-rust-server-service   LoadBalancer   10.97.3.118   <pending>     8000:30960/TCP   32s
service/kubernetes                ClusterIP      10.96.0.1     <none>        443/TCP          3m14s
```

After executing `minikube service --all`

```text
|-----------|-------------------------|-------------|---------------------------|
| NAMESPACE |          NAME           | TARGET PORT |            URL            |
|-----------|-------------------------|-------------|---------------------------|
| default   | app-rust-server-service |        8000 | http://192.168.49.2:30960 |
|-----------|-------------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-rust-server-service.
🏃  Starting tunnel for service kubernetes.
|-----------|-------------------------|-------------|------------------------|
| NAMESPACE |          NAME           | TARGET PORT |          URL           |
|-----------|-------------------------|-------------|------------------------|
| default   | app-rust-server-service |             | http://127.0.0.1:52643 |
| default   | kubernetes              |             | http://127.0.0.1:52653 |
|-----------|-------------------------|-------------|------------------------|
🎉  Opening service default/app-rust-server-service in default browser...
🎉  Opening service default/kubernetes in default browser...
```

Screenshot from browser

![](https://i.imgur.com/zb29CwT.png)

## [Bonus] K8S definitions

- Ingress — an application gateway that maps routes from outside to within a cluster, also usually serves as a load balancer
- Ingress controller — required by the Ingress to work, describes the rules of how the traffic proxying works
- StatefulSet — manages applications guarantying a stateful (not changed whenever rescheduling happens) identity for a pod
- DaemonSet — guarantees that a copy of a pod is created whenever a node is added
- PersistentVolumes — a provisioned by the administrator or a storage class type of storage
