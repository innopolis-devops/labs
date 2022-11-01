# k8s

## Mannual deploy of 'app_python'

```
ubuntu-1@ubuntu1:~/labs$ kubectl create deployment app-python --image=easeln/app_python:latest 
deployment.apps/app-python created
ubuntu-1@ubuntu1:~/labs$ kubectl expose deployment app-python --type=LoadBalancer --port=5000
service/app-python exposed
ubuntu-1@ubuntu1:~/labs$ kubectl get pods,svc
NAME                             READY   STATUS              RESTARTS   AGE
pod/app-python-96bd56bf4-rwjx5   0/1     ContainerCreating   0          82s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.102.98.28   <pending>     5000:30847/TCP   22s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          11m
ubuntu-1@ubuntu1:~/labs$ minikube service app-python
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        5000 | http://192.168.49.2:30847 |
|-----------|------------|-------------|---------------------------|
🎉  Opening service default/app-python in default browser...
ubuntu-1@ubuntu1:~/labs$ kubectl delete deployment,svc app-python
deployment.apps "app-python" deleted
service "app-python" deleted
```

## Deploy 'app_python' by config files
```
ubuntu-1@ubuntu1:~/labs$ kubectl apply -f k8s
deployment.apps/app-python-deployment created
service/app-python-service created
ubuntu-1@ubuntu1:~/labs$ kkubectl get pods,svc
^Cubuntu-1@ubuntu1:~/labs$ kubectl get pods,svc
NAME                                        READY   STATUS              RESTARTS   AGE
pod/app-python-664b9f9447-wcsvq             0/1     Terminating         0          3m24s
pod/app-python-deployment-c64c4457d-8p5dk   0/1     ContainerCreating   0          75s
pod/app-python-deployment-c64c4457d-v58sh   0/1     ErrImagePull        0          75s

NAME                         TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.99.4.252   <pending>     8000:30227/TCP   76s
service/kubernetes           ClusterIP      10.96.0.1     <none>        443/TCP          45m
ubuntu-1@ubuntu1:~/labs$ minikube service --all
❗  Executing "docker container inspect minikube --format={{.State.Status}}" took an unusually long time: 6.316835154s
💡  Restarting the docker service may improve performance.

^[[A^[[C^[[D|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        8000 | http://192.168.49.2:30227 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-service in default browser...

```
P.S. everything is so slow
