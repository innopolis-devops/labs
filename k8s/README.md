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

![01](https://github.com/dapp-anyway/devops/blob/lab10/k8s/screenshots/01.png)

![02](https://github.com/dapp-anyway/devops/blob/lab10/k8s/screenshots/02.png)

---

# Helm #

Installing Helm with command `choco install kubernetes-helm`

Creating Helm application `>>>`
```
PS C:\users\dappa\devops\devops\k8s> helm create devops-helm-app
Creating devops-helm-app
```

Install your helm chart and make sure that all services are healthy `>>>`
```
PS C:\users\dappa\devops\devops\k8s> helm package devops-helm-app
Successfully packaged chart and saved it to: C:\users\dappa\devops\devops\k8s\devops-helm-app-0.1.0.tgz

PS C:\users\dappa\devops\devops\k8s> helm install devops-helm-app ./devops-helm-app-0.1.0.tgz
NAME: devops-helm-app
LAST DEPLOYED: Sun Feb 19 14:43:40 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=devops-helm-app,app.kubernetes.io/instance=devops-helm-app" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
PS C:\users\dappa\devops\devops\k8s>


PS C:\users\dappa\devops\devops\k8s> minikube dashboard
* Enabling dashboard ...
  - Используется образ docker.io/kubernetesui/dashboard:v2.7.0
  - Используется образ docker.io/kubernetesui/metrics-scraper:v1.0.8
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server


* Verifying dashboard health ...
* Launching proxy ...
* Verifying proxy health ...
* Opening http://127.0.0.1:57002/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...

```

![03](https://github.com/dapp-anyway/devops/blob/lab10/k8s/screenshots/03.png)

![04](https://github.com/dapp-anyway/devops/blob/lab10/k8s/screenshots/04.png)

```
PS C:\users\dappa\devops\devops\k8s>  minikube service devops-helm-app
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | devops-helm-app | http/80     | http://192.168.49.2:30812 |
|-----------|-----------------|-------------|---------------------------|
* Starting tunnel for service devops-helm-app.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | devops-helm-app |             | http://127.0.0.1:58152 |
|-----------|-----------------|-------------|------------------------|
* Opening service default/devops-helm-app in default browser...
! Because you are using a Docker driver on windows, the terminal needs to be open to run it.

```

Also provide the output of the kubectl get pods,svc command in the report `>>>`

```
PS C:\users\dappa\devops\devops\k8s> kubectl get pods,svc
NAME                                            READY   STATUS    RESTARTS      AGE
pod/devops-helm-app-8678c84495-nrwzc            0/1     Running   2 (19s ago)   2m20s
pod/devops-server-deployment-74ffb95688-5mzdd   1/1     Running   0             19m
pod/devops-server-deployment-74ffb95688-gtx9c   1/1     Running   0             20m
pod/devops-server-deployment-74ffb95688-mbl5r   1/1     Running   0             20m
pod/devops-server-deployment-74ffb95688-w7tlc   1/1     Running   0             20m
pod/devops-server-deployment-74ffb95688-wz4lb   1/1     Running   0             19m

NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/devops-helm-app         LoadBalancer   10.103.165.160   <pending>     80:30812/TCP     2m20s
service/devops-server-service   LoadBalancer   10.104.230.177   <pending>     4000:31755/TCP   18m
service/kubernetes              ClusterIP      10.96.0.1        <none>        443/TCP          106m
PS C:\users\dappa\devops\devops\k8s>
```