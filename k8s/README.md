# K8S

## Lab 9

### Manual deployment

`kubectl get pods,svc`:

```text
NAME                            READY   STATUS    RESTARTS   AGE
pod/app-python-68ff5dd6-5znhx   1/1     Running   0          89s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.96.117.23   <pending>     8000:30720/TCP   83s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          83d
```

### Deployment via configuration files

`kubectl get pods,svc`:

```text
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-7d9f897f89-9fr6q   1/1     Running   0          4s
pod/app-python-deployment-7d9f897f89-k5x92   1/1     Running   0          5s
pod/app-python-deployment-7d9f897f89-lpj7f   1/1     Running   0          6s

NAME                         TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.96.89.37   <pending>     8000:30141/TCP   101s
service/kubernetes           ClusterIP      10.96.0.1     <none>        443/TCP          83d
```

`minikube service --all`:

```text
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        8000 | http://192.168.49.2:30141 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-python-service |             | http://127.0.0.1:57579 |
| default   | kubernetes         |             | http://127.0.0.1:57581 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

![](https://i.imgur.com/0IznMe2.png)

## Lab 10

### Deploy app-python

![](https://i.imgur.com/HSTpAyt.png)

`kubectl get pods,svc`:

```text
NAME                             READY   STATUS    RESTARTS   AGE
pod/app-python-597c89787-t9cqm   1/1     Running   0          4m59s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
service/app-python   ClusterIP   10.96.39.221   <none>        80/TCP    4m59s
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP   83d
```
