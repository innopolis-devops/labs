# k8s

## LAB10
![](https://i.imgur.com/5TDBUoF.png)

### kubectl get pods,svc

```
┌──(kali㉿kali)-[~]
└─$ minikube kubectl -- get pods,svc                     
NAME                              READY   STATUS    RESTARTS   AGE
pod/python-app-5dc7775b66-qmn6m   1/1     Running   0          37s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        330d
service/python-app   LoadBalancer   10.105.61.72   <pending>     80:30593/TCP   37s
```

![](https://i.imgur.com/aLwbpgL.png)


## LAB9

### kubectl get pods,svc

```
┌──(kali㉿kali)-[~]
└─$ minikube kubectl -- get pods,svc
NAME                             READY   STATUS    RESTARTS   AGE
pod/python-app-7fbdc769f-sbdcb   1/1     Running   0          4m8s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          326d
service/python-app   LoadBalancer   10.111.226.7   <pending>     8000:31924/TCP   2m12s
```

### kubectl get pods,svc
```
┌──(kali㉿kali)-[~]
└─$ minikube kubectl -- get pods,svc                                                                           130 ⨯
NAME                                         READY   STATUS    RESTARTS   AGE
pod/python-app-deployment-6958c9c8df-gsf2l   1/1     Running   0          9m35s
pod/python-app-deployment-6958c9c8df-kjms8   1/1     Running   0          9m35s
pod/python-app-deployment-6958c9c8df-wznq8   1/1     Running   0          9m35s

NAME                         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes           ClusterIP      10.96.0.1      <none>        443/TCP        326d
service/python-app-service   LoadBalancer   10.97.36.187   <pending>     80:30333/TCP   26s
```

### minikube service --all
```
┌──(kali㉿kali)-[~]
└─$ minikube service --all                                                                                      14 ⨯
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | python-app-service |          80 | http://192.168.49.2:30333 |
|-----------|--------------------|-------------|---------------------------|
```

![](https://i.imgur.com/PdhDTN9.png)

