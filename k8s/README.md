# k8s 

Grigorii Kostarev

### Output of `kubectl get pods,svc` (inconvenient way):
```
grishakostarev@Grishas-MacBook-Pro labs % kubectl get pods,svc
NAME                            READY   STATUS    RESTARTS   AGE
pod/app-python-8496f845-bhh9d   1/1     Running   0          5m37s

NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.104.223.168   <pending>     8080:32592/TCP   2m55s
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          7m23s
```

### Output of `kubectl get pods,svc`:
```
grishakostarev@Grishas-MacBook-Pro k8s % kubectl get pods,svc                    
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-5bddc779cf-p6mcr   1/1     Running   0          74m
pod/app-python-deployment-5bddc779cf-p9xdn   1/1     Running   0          74m
pod/app-python-deployment-5bddc779cf-r7lz9   1/1     Running   0          74m

NAME                         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.98.64.140   <pending>     8080:31507/TCP   65m
service/kubernetes           ClusterIP      10.96.0.1      <none>        443/TCP          70m
```

### Output of `minikube service --all`:
```
grishakostarev@Grishas-MacBook-Pro k8s % minikube service --all                  
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        8080 | http://192.168.49.2:31507 |
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
| default   | app-python-service |             | http://127.0.0.1:50535 |
| default   | kubernetes         |             | http://127.0.0.1:50537 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

### Screen:
![](screens/app_python.jpeg)

## Bonus
### Output of `kubectl get pods,svc`:
```
grishakostarev@Grishas-MacBook-Pro k8s % kubectl get pods,svc  
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-java-deployment-dbdc7b8f7-4rc9f      1/1     Running   0          3m4s
pod/app-java-deployment-dbdc7b8f7-jv55v      1/1     Running   0          3m4s
pod/app-java-deployment-dbdc7b8f7-skj9t      1/1     Running   0          3m4s
pod/app-python-deployment-5bddc779cf-p6mcr   1/1     Running   0          87m
pod/app-python-deployment-5bddc779cf-p9xdn   1/1     Running   0          87m
pod/app-python-deployment-5bddc779cf-r7lz9   1/1     Running   0          87m

NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-java-service     LoadBalancer   10.110.127.10   <pending>     8080:32324/TCP   3m4s
service/app-python-service   LoadBalancer   10.98.64.140    <pending>     8080:31507/TCP   79m
service/kubernetes           ClusterIP      10.96.0.1       <none>        443/TCP          83m
```

### Output of `minikube service --all`:
```
grishakostarev@Grishas-MacBook-Pro k8s % minikube service --all
|-----------|------------------|-------------|---------------------------|
| NAMESPACE |       NAME       | TARGET PORT |            URL            |
|-----------|------------------|-------------|---------------------------|
| default   | app-java-service |        8080 | http://192.168.49.2:32324 |
|-----------|------------------|-------------|---------------------------|
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        8080 | http://192.168.49.2:31507 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-java-service.
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-java-service   |             | http://127.0.0.1:50678 |
| default   | app-python-service |             | http://127.0.0.1:50680 |
| default   | kubernetes         |             | http://127.0.0.1:50682 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-java-service in default browser...
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

### Screen
![](screens/app_java.jpeg)

### Terminology
* __Ingress__: interface which makes accessible inner cluster services from external world. 
* __Ingress controller__: pod for processing and routing the incoming request, mostly as a load balancer.
* __StatefulSet__: interface for managing the application such aspects as deployment and scaling, for example.
* __DaemonSet__: object for placing the same pods on all nodes. 
* __PersistentVolumes__: piece of storage for managing it.