# k8s
## Manual deploying of `app_python`
1. `kubectl create deployment app-python --image=nailyav/lab2:latest`
```bash
[nailya@nailya DevOps-labs]$ kubectl create deployment app-python --image=nailyav/lab2:latest
deployment.apps/app-python created
```

2. `kubectl expose deployment app-python --type=LoadBalancer --port=5000`
```bash
[nailya@nailya DevOps-labs]$ kubectl expose deployment app-python --type=LoadBalancer --port=5000
service/app-python exposed
```

3. `kubectl get pods,svc`
```bash
[nailya@nailya DevOps-labs]$ kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-766b59c777-rvnc6   1/1     Running   0          72s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.98.63.245   <pending>     5000:30846/TCP   16s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          5m2s
```

4. `minikube service app-python`
```bash
[nailya@nailya DevOps-labs]$ minikube service app-python
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        5000 | http://192.168.49.2:30846 |
|-----------|------------|-------------|---------------------------|
🎉  Opening service default/app-python in default browser...
```
![image](https://github.com/nailyav/DevOps-labs/blob/lab9/k8s/assets/Screenshot_manual.png)

5. `kubectl delete deployment,svc app-python`
```bash
[nailya@nailya DevOps-labs]$ kubectl delete deployment,svc app-python
deployment.apps "app-python" deleted
service "app-python" deleted
```

## Deploying of `app_python` using config files
1. `kubectl apply -f k8s`
```bash
[nailya@nailya DevOps-labs]$ kubectl apply -f k8s
service/app-python-service created
deployment.apps/app-python-deployment created
```

2. `kubectl get pods,svc`
```bash
[nailya@nailya DevOps-labs]$ kubectl get pods,svc
NAME                                        READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-9fc456cfd-ffhc9   1/1     Running   0          42s
pod/app-python-deployment-9fc456cfd-fs4p8   1/1     Running   0          42s
pod/app-python-deployment-9fc456cfd-mnwl7   1/1     Running   0          42s

NAME                         TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.98.90.62   <pending>     5000:30085/TCP   42s
service/kubernetes           ClusterIP      10.96.0.1     <none>        443/TCP          11m
```

3. `minikube service --all`
```bash
[nailya@nailya DevOps-labs]$ minikube service --all
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        5000 | http://192.168.49.2:30085 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-service in default browser...
```
![image](https://github.com/nailyav/DevOps-labs/blob/lab9/k8s/assets/Screenshot_config.png)
