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

# Helm

## Dashboard
![](https://i.imgur.com/yxMuCKJ.png)

## Service
```shell
$minikube service --all
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|--------------------|-------------|--------------|
| NAMESPACE |        NAME        | TARGET PORT |     URL      |
|-----------|--------------------|-------------|--------------|
| default   | web-app-1667842228 |             | No node port |
|-----------|--------------------|-------------|--------------|
😿  service default/web-app-1667842228 has no node port
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service web-app-1667842228.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | kubernetes         |             | http://127.0.0.1:57378 |
| default   | web-app-1667842228 |             | http://127.0.0.1:57382 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/web-app-1667842228 in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
^C✋  Stopping tunnel for service web-app-1667842228.
✋  Stopped tunnel for service kubernetes.
```

## Kubectl
```shell
$kubectl get pods,svc
NAME                                      READY   STATUS    RESTARTS   AGE
pod/web-app-1667842228-7998cc6799-m8svb   1/1     Running   0          2m6s

NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP   4m3s
service/web-app-1667842228   ClusterIP   10.104.132.109   <none>        80/TCP    2m6s
```

```shell
$helm list
NAME              	NAMESPACE	REVISION	UPDATED                            	STATUS  	CHART        	APP VERSION
web-app-1667842228	default  	1       	2022-11-07 20:30:28.50584 +0300 MSK	deployed	web-app-0.1.0	1.16.0
```
