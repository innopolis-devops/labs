# Kubernetes

## Get Pods and Services
```shell
$kubectl get pods,svc
NAME                                     READY   STATUS    RESTARTS   AGE
pod/webapp-deployment-85dbc66b98-bns84   1/1     Running   0          22m
pod/webapp-deployment-85dbc66b98-cr49q   1/1     Running   0          22m
pod/webapp-deployment-85dbc66b98-d2qvh   1/1     Running   0          22m

NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes       ClusterIP   10.96.0.1        <none>        443/TCP   111m
service/webapp-service   ClusterIP   10.100.239.154   <none>        80/TCP    10m
```

## minikube service
```shell
$minikube service --all
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|----------------|-------------|--------------|
| NAMESPACE |      NAME      | TARGET PORT |     URL      |
|-----------|----------------|-------------|--------------|
| default   | webapp-service |             | No node port |
|-----------|----------------|-------------|--------------|
😿  service default/webapp-service has no node port
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service webapp-service.
|-----------|----------------|-------------|------------------------|
| NAMESPACE |      NAME      | TARGET PORT |          URL           |
|-----------|----------------|-------------|------------------------|
| default   | kubernetes     |             | http://127.0.0.1:59661 |
| default   | webapp-service |             | http://127.0.0.1:59665 |
|-----------|----------------|-------------|------------------------|
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/webapp-service in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
^C✋  Stopping tunnel for service webapp-service.
✋  Stopped tunnel for service kubernetes.
```
![](https://i.imgur.com/aq7bK7l.png)
