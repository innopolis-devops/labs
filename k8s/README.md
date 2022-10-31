## Lab 9 - kubernetes

1. `kubectl apply -f .`

2. `minikube service wtiiim-service`

![img_2.png](img_2.png)

Note that the port in the cli 65254 corresponds to the port in the browser

![img.png](img.png)

```bash
$ kubectl get pods,svc
NAME                                       READY   STATUS    RESTARTS   AGE
pod/wtiiim-deployment-5ff54dbf96-69vtt     1/1     Running   0          11m
pod/wtiiim-deployment-5ff54dbf96-fxdhg     1/1     Running   0          11m
pod/wtiiim-deployment-5ff54dbf96-wblm5     1/1     Running   0          11m

NAME                       TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/kubernetes         ClusterIP      10.96.0.1       <none>        443/TCP          42m
service/wtiiim-service     LoadBalancer   10.111.28.17    <pending>     8081:30776/TCP   11m
```

```bash
$ minikube service --all
         
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|----------------|-------------|---------------------------|
| NAMESPACE |      NAME      | TARGET PORT |            URL            |
|-----------|----------------|-------------|---------------------------|
| default   | wtiiim-service |        8081 | http://192.168.49.2:30776 |
|-----------|----------------|-------------|---------------------------|
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service wtiiim-service.
|-----------|------------------|-------------|------------------------|
| NAMESPACE |       NAME       | TARGET PORT |          URL           |
|-----------|------------------|-------------|------------------------|
| default   | kubernetes       |             | http://127.0.0.1:49482 |
| default   | wtiiim-service   |             | http://127.0.0.1:49500 |
|-----------|------------------|-------------|------------------------|
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/wtiiim-service in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
    
```

![img_3.png](img_3.png)