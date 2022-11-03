# 1. After deploying and making a service

## The Output of ``` kubectl get pods,svc```

```sh
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-64d6bc4d8d-xsjlt   1/1     Running   0          6m14s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.106.60.82   <pending>     8080:31216/TCP   3m44s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          12h
```

## The Output of ``` minikube service --all```

```sh
|-----------|-------------|-------------|---------------------------|
| NAMESPACE |    NAME     | TARGET PORT |            URL            |
|-----------|-------------|-------------|---------------------------|
| default   | app-express |        8080 | http://192.168.64.4:31524 |
|-----------|-------------|-------------|---------------------------|
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        8080 | http://192.168.64.4:30982 |
|-----------|------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-express in default browser...
🎉  Opening service default/app-python in default browser...
```

## Screenshot from App1
![](./images/manual-config1.png)
## Screenshot from App2
![](./images/manual-config2.png)

# 2. After writing deployment and service configuration files for both apps

## The Output of ``` kubectl get pods,svc```

```sh
 kubectl get pods,svc
NAME                               READY   STATUS    RESTARTS   AGE
pod/app-express-5b88854d68-ddkhn   1/1     Running   0          87s
pod/app-express-5b88854d68-dxmjp   1/1     Running   0          95s
pod/app-express-5b88854d68-td2g7   1/1     Running   0          91s
pod/app-python-6b9884b566-4h7r8    1/1     Running   0          4m51s
pod/app-python-6b9884b566-4nxz4    1/1     Running   0          4m51s
pod/app-python-6b9884b566-h84wz    1/1     Running   0          4m51s

NAME                  TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-express   LoadBalancer   10.106.202.225   <pending>     8080:31397/TCP   2m13s
service/app-python    LoadBalancer   10.104.167.148   <pending>     8080:30291/TCP   2m46s
service/kubernetes    ClusterIP      10.96.0.1        <none>        443/TCP          2m45s
```

## The Output of ``` minikube service --all```

```sh
|-----------|-------------|-------------|---------------------------|
| NAMESPACE |    NAME     | TARGET PORT |            URL            |
|-----------|-------------|-------------|---------------------------|
| default   | app-express |        8080 | http://192.168.64.4:31397 |
|-----------|-------------|-------------|---------------------------|
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        8080 | http://192.168.64.4:30291 |
|-----------|------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-express in default browser...
🎉  Opening service default/app-python in default browser...
```

## Screenshot from App1
![](./images/file-config1.png)
## Screenshot from App2
![](./images/file-config2.png)