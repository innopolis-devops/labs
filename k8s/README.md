# Lab 9 (Kubernetes)

## Part I: python app

### Manual deployment (python)

```
$ minikube start --kubernetes-version=v1.23.12
...
$ kubectl create deployment simple-python-app --image=johndenkis/simple_python_app_v2:latest 
deployment.apps/simple-python-app created

$ kubectl expose deployment simple-python-app --type=LoadBalancer --port=5000
service/simple-python-app exposed

$ kubectl get pods,svc
NAME                                     READY   STATUS    RESTARTS   AGE
pod/simple-python-app-68dbb78977-kpgvb   1/1     Running   0          2m4s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP          2m19s
service/simple-python-app   LoadBalancer   10.106.118.18   <pending>     5000:31721/TCP   30s

$minikube service simple-python-app                
|-----------|-------------------|-------------|---------------------------|
| NAMESPACE |       NAME        | TARGET PORT |            URL            |
|-----------|-------------------|-------------|---------------------------|
| default   | simple-python-app |        5000 | http://192.168.49.2:31721 |
|-----------|-------------------|-------------|---------------------------|
🎉  Opening service default/simple-python-app in default browser...
➜   Opening in existing browser session.

$ kubectl delete service simple-python-app
service "simple-python-app" deleted
$ kubectl delete deployment simple-python-app
deployment.apps "simple-python-app" deleted
```

Result from browser at http://192.168.49.2:31721:

![python_app](assets/python_app_man.jpg)

### Manifest deployment (python)

```
$ cd ./app_python

$ kubectl apply -f .
deployment.apps/simple-python-app-deployment created
service/simple-python-app-service created

$ kubectl get pods,svc                    
NAME                                               READY   STATUS    RESTARTS   AGE
pod/simple-python-app-deployment-b4c87b497-bjz9v   1/1     Running   0          54s
pod/simple-python-app-deployment-b4c87b497-pvnwq   1/1     Running   0          54s
pod/simple-python-app-deployment-b4c87b497-wmgh6   1/1     Running   0          54s

NAME                                TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/kubernetes                  ClusterIP      10.96.0.1       <none>        443/TCP          12m
service/simple-python-app-service   LoadBalancer   10.109.26.231   <pending>     5000:31540/TCP   54s

$ minikube service --all
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|---------------------------|-------------|---------------------------|
| NAMESPACE |           NAME            | TARGET PORT |            URL            |
|-----------|---------------------------|-------------|---------------------------|
| default   | simple-python-app-service |        5000 | http://192.168.49.2:31540 |
|-----------|---------------------------|-------------|---------------------------|
🎉  Opening service default/simple-python-app-service in default browser...
➜   Opening in existing browser session.
```

Result from the browser at http://192.168.49.2:31540:

![python_app](assets/python_app.jpg)

## Part II: golang app (bonus)

### Manifest deployment (golang)

```
$ cd ./app_go

$ kubectl apply -f .                                
deployment.apps/simple-go-app-deployment created
service/simple-go-app-service created

$ kubectl get pods,svc  
NAME                                            READY   STATUS    RESTARTS   AGE
pod/simple-go-app-deployment-68b65f9694-b6kms   1/1     Running   0          2m11s
pod/simple-go-app-deployment-68b65f9694-pg2m5   1/1     Running   0          2m11s
pod/simple-go-app-deployment-68b65f9694-w6gp6   1/1     Running   0          2m11s

NAME                            TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes              ClusterIP      10.96.0.1      <none>        443/TCP          28m
service/simple-go-app-service   LoadBalancer   10.96.210.97   <pending>     2222:31937/TCP   2m11s

$ minikube service --all
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|-----------------------|-------------|---------------------------|
| NAMESPACE |         NAME          | TARGET PORT |            URL            |
|-----------|-----------------------|-------------|---------------------------|
| default   | simple-go-app-service |        2222 | http://192.168.49.2:31937 |
|-----------|-----------------------|-------------|---------------------------|
🎉  Opening service default/simple-go-app-service in default browser...
➜   Opening in existing browser session.
```

Result from the browser at http://192.168.49.2:31937:

![go_app](assets/go_app.jpg)

## Part III: description (bonus)

* Ingress - the rules for proxying traffic from an external source to services inside the k8s cluster.
* Ingress controller - the implementation for the Ingress (for example, GCE and Nginx)
* StatefulSet - resource used for managing deployment and scaling of pods of stateful apps
* DaemonSet - resource that ensures the pod runs on all the nodes of the cluster; automatically adds and deletes the pod
* PersistentVolumes - storage system that have a lifecycle independent of any individual pod