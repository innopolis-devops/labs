# Kubernetes

## Manual deployment


```shell
❯ kubectl create deployment app-python-node --image=ilyakolomin/devops_app_python:latest
deployment.apps/app-python-node created
❯ kubectl expose deployment app-python-node --type=LoadBalancer --port=8000
service/app-python-node exposed
❯ kubectl get pods,svc
NAME                                   READY   STATUS    RESTARTS   AGE
pod/app-python-node-597d7c758b-mbwsr   1/1     Running   0          2m2s

NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python-node   LoadBalancer   10.100.99.114   <pending>     8000:30298/TCP   20s
service/kubernetes        ClusterIP      10.96.0.1       <none>        443/TCP          4m17s
❯ minikube service app-python-node
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | app-python-node |        8000 | http://192.168.49.2:30298 |
|-----------|-----------------|-------------|---------------------------|
🏃  Starting tunnel for service app-python-node.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | app-python-node |             | http://127.0.0.1:56446 |
|-----------|-----------------|-------------|------------------------|
🎉  Opening service default/app-python-node in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
^C✋  Stopping tunnel for service app-python-node.
❯ kubectl delete service app-python-node
service "app-python-node" deleted
❯ kubectl delete deployment app-python-node
deployment.apps "app-python-node" deleted
```

## Using manifests

```shell
❯ kubectl apply -f app_python_deployment.yml
deployment.apps/app-python-deployment created
❯ kubectl apply -f app_go_deployment.yml
deployment.apps/app-go-deployment created
❯ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-go-deployment-7cdb7d5fc-rh85x        1/1     Running   0          9s
pod/app-python-deployment-65d579475c-scr6n   1/1     Running   0          25s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   86m
❯ kubectl apply -f app_python_service.yml
service/app-python-service created
❯ kubectl apply -f app_go_service.yml
service/app-go-service created
❯ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-go-deployment-7cdb7d5fc-rh85x        1/1     Running   0          2m56s
pod/app-python-deployment-65d579475c-scr6n   1/1     Running   0          3m12s

NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/app-go-service       ClusterIP   10.105.231.223   <none>        8081/TCP   7s
service/app-python-service   ClusterIP   10.99.207.108    <none>        8001/TCP   29s
service/kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP    88m
❯ minikube service --all
|-----------|----------------|-------------|--------------|
| NAMESPACE |      NAME      | TARGET PORT |     URL      |
|-----------|----------------|-------------|--------------|
| default   | app-go-service |             | No node port |
|-----------|----------------|-------------|--------------|
😿  service default/app-go-service has no node port
|-----------|--------------------|-------------|--------------|
| NAMESPACE |        NAME        | TARGET PORT |     URL      |
|-----------|--------------------|-------------|--------------|
| default   | app-python-service |             | No node port |
|-----------|--------------------|-------------|--------------|
😿  service default/app-python-service has no node port
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-go-service.
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-go-service     |             | http://127.0.0.1:56951 |
| default   | app-python-service |             | http://127.0.0.1:56961 |
| default   | kubernetes         |             | http://127.0.0.1:56971 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-go-service in default browser...
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
^C✋  Stopping tunnel for service kubernetes.
✋  Stopped tunnel for service app-python-service.
✋  Stopped tunnel for service app-go-service.
```

![](https://i.imgur.com/uqgiBIh.png)
![](https://i.imgur.com/5k0Wjpj.png)

## Theoretical questions answer

1. Ingress provides access to the services on cluster from extranet. It also manages TLS for https and provides load-balancing.
Moreover, it provides rules for access, for instance restricts some url paths. It is not a running instance, but rather a 
declarative thing.
2. Ingress controller - controller process, which makes ingress work. Contains actual implementation of management
reverse-proxy access, for instance nginx could be used.
3. StatefulSet - manager of deployment and scaling of pods. Its main feature that it persist state of the set of pods in some storage.
4. DaemonSet - makes nodes to run the copies of specific pod. Useful for running some logs/health-check/storage daemons on nodes to ensure 
stability.
5. PersistentVolumes - just volume to store some data. It is a resource like a node, but its lifecycle is independent of the associated pod. 