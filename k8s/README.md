1. 
```bash 
minikube start
```
2. 
```bash 
kubectl create deployment app-python --image=yadariya/devops:latest
kubectl expose deployment app-python --type=LoadBalancer --port=8080
```
3. 
```bash 
kubectl get pods,svc
```
output:
```bash
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-5f84cfd997-flfd4   1/1     Running   0          10m

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.111.0.174   <pending>     8080:31235/TCP   9m17s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          16m
```
4. for deleting deployment and service 
```bash
minikube delete
``` 
5. for adding config files
```bash
kubectl apply -f deployment.yml
kubectl apply -f service.yml
```
6. 
```bash 
kubectl get pods,svc
```
output:
```bash
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-7fc577c86b-7vdt7   1/1     Running   0          91s
pod/app-python-deployment-7fc577c86b-g5k2b   1/1     Running   0          91s
pod/app-python-deployment-7fc577c86b-kwdqn   1/1     Running   0          91s

NAME                         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.108.67.39   <pending>     5000:31442/TCP   84s
service/kubernetes           ClusterIP      10.96.0.1      <none>        443/TCP          107s
```
7.  
```bash 
minikube service --all
```
output: 
```bash
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        5000 | http://192.168.49.2:31442 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-service in default browser...
```
result from my browser
![img.png](img.png)