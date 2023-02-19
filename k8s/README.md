# k8s #

---

## Deploy and Clean up ##

```
PS C:\users\dappa\devops\devops\k8s> kubectl create deployment new-devops --image=dapp7anyway/devops:latest             deployment.apps/new-devops created
PS C:\users\dappa\devops\devops\k8s> kubectl expose deployment new-devops --type=LoadBalancer --port=8068
service/new-devops exposed

PS C:\users\dappa\devops\devops\k8s> kubectl get services
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          12m
new-devops   LoadBalancer   10.107.40.88   <pending>     8068:30569/TCP   20s
PS C:\users\dappa\devops\devops\k8s>

PS C:\users\dappa\devops\devops\k8s> kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/new-devops-65496b9dc6-2h8vg   1/1     Running   0          7m52s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          17m
service/new-devops   LoadBalancer   10.107.40.88   <pending>     8068:30569/TCP   5m20s
PS C:\users\dappa\devops\devops\k8s>

```

**Delete service and deployment:**
```
PS C:\users\dappa\devops\devops\k8s> kubectl delete service new-devops
service "new-devops" deleted
PS C:\users\dappa\devops\devops\k8s> kubectl delete deployment new-devops
deployment.apps "new-devops" deleted
```

---

## Using Configuration file ##

Use configuration files `deployment.yml` and `service.yml` to deploy application

```
PS C:\users\dappa\devops\devops\k8s> kubectl apply -f ./app_python
deployment.apps/devops-server-deployment created
service/devops-server-service created

PS C:\users\dappa\devops\devops\k8s> minikube service --all
|-----------|-----------------------|-------------|---------------------------|
| NAMESPACE |         NAME          | TARGET PORT |            URL            |
|-----------|-----------------------|-------------|---------------------------|
| default   | devops-server-service |        4000 | http://192.168.49.2:31623 |
|-----------|-----------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
* service default/kubernetes has no node port
* Starting tunnel for service devops-server-service.
* Starting tunnel for service kubernetes.
|-----------|-----------------------|-------------|------------------------|
| NAMESPACE |         NAME          | TARGET PORT |          URL           |
|-----------|-----------------------|-------------|------------------------|
| default   | devops-server-service |             | http://127.0.0.1:56480 |
| default   | kubernetes            |             | http://127.0.0.1:56481 |
|-----------|-----------------------|-------------|------------------------|
* Opening service default/devops-server-service in default browser...
* Opening service default/kubernetes in default browser...
! Because you are using a Docker driver on windows, the terminal needs to be open to run it.
```

![01](https://github.com/dapp-anyway/devops/blob/lab9/k8s/screenshots/01.png)

![02](https://github.com/dapp-anyway/devops/blob/lab9/k8s/screenshots/02.png)