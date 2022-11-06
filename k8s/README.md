# K8S - Lab 9

## Output of `kubectl get pods,svc` when creating by hand

```
NAME                                   READY   STATUS    RESTARTS   AGE
pod/moscow-time-app-5d9c46cff6-xcqd5   1/1     Running   0          3m38s

NAME                      TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes        ClusterIP      10.96.0.1      <none>        443/TCP          11m
service/moscow-time-app   LoadBalancer   10.103.57.96   <pending>     5000:32627/TCP   102s
```

## Output of `kubectl get pods,svc` when creating using configs

```
NAME                                                  READY   STATUS    RESTARTS   AGE
pod/moscow-time-web-app-deployment-5b994b8575-9zw6t   1/1     Running   0          32s
pod/moscow-time-web-app-deployment-5b994b8575-k97x8   1/1     Running   0          32s
pod/moscow-time-web-app-deployment-5b994b8575-r75jw   1/1     Running   0          32s

NAME                          TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes            ClusterIP      10.96.0.1      <none>        443/TCP          27m
service/moscow-time-web-app   LoadBalancer   10.97.123.31   <pending>     5000:30008/TCP   29s
```

## Output of `minikube service --all`


```
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|---------------------|-------------|---------------------------|
| NAMESPACE |        NAME         | TARGET PORT |            URL            |
|-----------|---------------------|-------------|---------------------------|
| default   | moscow-time-web-app |        5000 | http://192.168.49.2:30008 |
|-----------|---------------------|-------------|---------------------------|
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service moscow-time-web-app.
|-----------|---------------------|-------------|------------------------|
| NAMESPACE |        NAME         | TARGET PORT |          URL           |
|-----------|---------------------|-------------|------------------------|
| default   | kubernetes          |             | http://127.0.0.1:63930 |
| default   | moscow-time-web-app |             | http://127.0.0.1:63934 |
|-----------|---------------------|-------------|------------------------|
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/moscow-time-web-app in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

# K8S & Helm - Lab 10

##  Helm Chart

![Proof](./screenshots/dashboard.png)

## `kubectl get pods, svc`

```
NAME                             READY   STATUS    RESTARTS   AGE
pod/app-python-85b864c87-fc4sg   1/1     Running   0          104s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
service/app-python   ClusterIP   10.96.202.37   <none>        80/TCP    104s
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP   7d19h
```