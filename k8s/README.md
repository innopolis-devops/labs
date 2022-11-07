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


# Helm

1. Inside the _k8s_ folder use `helm create your-app` to create a template.

``` bash
nailya@nailya k8s]$ helm create app-python
Creating app-python
```

2. Install your `helm` chart

``` bash
[nailya@nailya k8s]$ helm install ./app-python/ --generate-name
NAME: app-python-1667863292
LAST DEPLOYED: Tue Nov  8 02:21:32 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace default svc -w app-python-1667863292'
  export SERVICE_IP=$(kubectl get svc --namespace default app-python-1667863292 --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo http://$SERVICE_IP:80
``` 

3. Check _Workloads_ page in the `minikube dashboard`:

``` bash
[nailya@nailya k8s]$ minikube dashboard
🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:32947/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
```

![image](https://github.com/nailyav/DevOps-labs/blob/lab10/k8s/assets/Screenshot_dashboard.PNG)


4. Check it by `minikube service your_service_name` command

``` bash
[nailya@nailya k8s]$ minikube service app-python-1667863292
|-----------|-----------------------|-------------|---------------------------|
| NAMESPACE |         NAME          | TARGET PORT |            URL            |
|-----------|-----------------------|-------------|---------------------------|
| default   | app-python-1667863292 | http/80     | http://192.168.49.2:32235 |
|-----------|-----------------------|-------------|---------------------------|
🎉  Opening service default/app-python-1667863292 in default browser...

```

![image](https://github.com/nailyav/DevOps-labs/blob/lab10/k8s/assets/Screenshot_service.PNG)


5. Provide the output of `kubectl get pods,svc` command in the report

``` bash
[nailya@nailya k8s]$ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS      AGE
pod/app-python-1667863292-6c7f88b875-4mkj7   1/1     Running   0             4m7s
pod/app-python-deployment-9fc456cfd-ffhc9    1/1     Running   1 (19m ago)   7d4h
pod/app-python-deployment-9fc456cfd-fs4p8    1/1     Running   1 (19m ago)   7d4h
pod/app-python-deployment-9fc456cfd-mnwl7    1/1     Running   1 (19m ago)   7d4h

NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python-1667863292   LoadBalancer   10.103.100.150   <pending>     80:32235/TCP     4m7s
service/app-python-service      LoadBalancer   10.98.90.62      <pending>     5000:30085/TCP   7d4h
service/kubernetes              ClusterIP      10.96.0.1        <none>        443/TCP          7d5h
```
