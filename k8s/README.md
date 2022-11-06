# Kubernetes

## Deployment using "inconvenient way"

```console
$ kubectl create deployment app-python --image=ghcr.io/sevenzing/currenttime:lat
est
deployment.apps/app-python created

$ kubectl expose deployment app-python --type=LoadBalancer --port=4444
service/app-python exposed

$ kubectl get pods,svc
NAME                              READY   STATUS             RESTARTS   AGE
pod/app-python-6fb6645478-52z57   0/1     ImagePullBackOff   0          4m20s

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.98.200.143   <pending>     4444:30913/TCP   3m19s
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          5m36s

$ minikube service app-python
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        4444 | http://192.168.49.2:31304 |
|-----------|------------|-------------|---------------------------|
🏃  Starting tunnel for service app-python.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | app-python |             | http://127.0.0.1:56103 |
|-----------|------------|-------------|------------------------|
🎉  Opening service default/app-python in default browser...

> curl localhost:56103
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Innopolis DevOps</title>
</head>
<body>
    <center><p>Hello from Python app!</p></center>
    <center><p>MSK time: 17:09:32</p></center>
</body>
</html> %
```

## Clean up

```console
$ kubectl delete deployment,svc app-python
deployment.apps "app-python" deleted
service "app-python" deleted
```

## Deployment using declarative approach

> note: I decided to include my extra app right away for bonus task here

Added `app_python/deployment.yml` and `app_rust/deployment.yml`.

Deployment:

```console
$ cd k8s

$ kubectl apply -f ./app_python
deployment.apps/app-python-deployment created
service/app-python-service created

$ kubectl apply -f ./app_rust
deployment.apps/app-rust-deployment created
service/app-rust-service created

$ kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-77b77846b4-5jhs6   1/1     Running   0          29m
pod/app-python-deployment-77b77846b4-qpj9r   1/1     Running   0          29m
pod/app-python-deployment-77b77846b4-r6t25   1/1     Running   0          29m
pod/app-rust-deployment-77744d76db-dx7zq     1/1     Running   0          64s
pod/app-rust-deployment-77744d76db-v24hz     1/1     Running   0          64s
pod/app-rust-deployment-77744d76db-vjstt     1/1     Running   0          64s

NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.104.234.34   <pending>     4444:30679/TCP   29m
service/app-rust-service     LoadBalancer   10.98.94.99     <pending>     4444:31928/TCP   64s
service/kubernetes           ClusterIP      10.96.0.1       <none>        443/TCP          50m
```

Added `app_python/service.yml` and `app_rust/service.yml`.

Service:

```console
minikube service --all
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        4444 | http://192.168.49.2:30679 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------------|-------------|---------------------------|
| NAMESPACE |       NAME       | TARGET PORT |            URL            |
|-----------|------------------|-------------|---------------------------|
| default   | app-rust-service |        4444 | http://192.168.49.2:31928 |
|-----------|------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service app-rust-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-python-service |             | http://127.0.0.1:56647 |
| default   | app-rust-service   |             | http://127.0.0.1:56653 |
| default   | kubernetes         |             | http://127.0.0.1:56659 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/app-rust-service in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

Access from browser:

![browser-access](https://i.imgur.com/eDEWl9C.png)

## Bonus task

1. Ingress — set of rules to handle requests from client (typically over HTTP) and pass it to the services in a cluster.
2. Ingress controller - actual pod to handle these requests like a proxy or loadbalancer. for example [nginx](https://github.com/kubernetes/ingress-nginx) can be used for ingress controller
3. StatefulSet - object that manages pods: scale, update or order deployments
4. DaemonSet - object that checks nodes and guarantees they are running the same pods.
5. PersistentVolumes - storage objects that do not depend on the lifetime of the pods that use them.

# Helm

## 10 Points

Building and installing chart:

```console
$ helm create helm-app-python 
Creating helm-app-python

... changing image name, tag and port

$ helm package helm-app-python 
Successfully packaged chart and saved it to: /Users/levlymarenko/innopolis/devops/k8s/helm-app-python-0.1.0.tgz

$ helm install helm-app-python ./helm-app-python-0.1.0.tgz
NAME: helm-app-python
LAST DEPLOYED: Sun Nov  6 11:09:28 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace default svc -w helm-app-python'
  export SERVICE_IP=$(kubectl get svc --namespace default helm-app-python --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo http://$SERVICE_IP:80
```

Workload status:

![minikube dashboard](https://i.imgur.com/CCoZtHk.png)

Checking service:

```console
$ minikube service helm-app-python
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | helm-app-python | http/80     | http://192.168.49.2:31598 |
|-----------|-----------------|-------------|---------------------------|
🏃  Starting tunnel for service helm-app-python.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | helm-app-python |             | http://127.0.0.1:64188 |
|-----------|-----------------|-------------|------------------------|
🎉  Opening service default/helm-app-python in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.

$ kubectl get pods,svc
NAME                                   READY   STATUS    RESTARTS   AGE
pod/helm-app-python-7c6df4744b-r6ksh   1/1     Running   0          8m49s

NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/helm-app-python      LoadBalancer   10.106.24.208   <pending>     80:31598/TCP     8m49s
service/kubernetes           ClusterIP      10.96.0.1       <none>        443/TCP          6d18h

$ helm list                                               
NAME            NAMESPACE       REVISION        UPDATED                                STATUS          CHART                   APP VERSION
helm-app-python default         1               2022-11-06 11:09:28.074735 +0300 MSK   deployed        helm-app-python-0.1.0   1.16.0
```

## Bonus

### Extra app

```console
...the same steps as before...

$ helm list
NAME            NAMESPACE       REVISION        UPDATED                                STATUS          CHART                   APP VERSION
helm-app-python default         1               2022-11-06 11:09:28.074735 +0300 MSK   deployed        helm-app-python-0.1.0   1.16.0     
helm-app-rust   default         1               2022-11-06 11:24:29.654766 +0300 MSK   deployed        helm-app-rust-0.1.0     1.16.0

$ kubectl get pods,svc
NAME                                   READY   STATUS             RESTARTS   AGE
pod/helm-app-python-7c6df4744b-r6ksh   1/1     Running            0          16m
pod/helm-app-rust-78fbb8447d-ghkff     0/1     ImagePullBackOff   0          79s

NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/helm-app-python      LoadBalancer   10.106.24.208   <pending>     80:31598/TCP     16m
service/helm-app-rust        LoadBalancer   10.106.247.96   <pending>     80:31572/TCP     79s
service/kubernetes           ClusterIP      10.96.0.1       <none>        443/TCP          6d18h

$ minikube service helm-app-python helm-app-rust 
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | helm-app-python | http/80     | http://192.168.49.2:31598 |
|-----------|-----------------|-------------|---------------------------|
|-----------|---------------|-------------|---------------------------|
| NAMESPACE |     NAME      | TARGET PORT |            URL            |
|-----------|---------------|-------------|---------------------------|
| default   | helm-app-rust | http/80     | http://192.168.49.2:31572 |
|-----------|---------------|-------------|---------------------------|
🏃  Starting tunnel for service helm-app-python.
🏃  Starting tunnel for service helm-app-rust.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | helm-app-python |             | http://127.0.0.1:65006 |
| default   | helm-app-rust   |             | http://127.0.0.1:65012 |
|-----------|-----------------|-------------|------------------------|
🎉  Opening service default/helm-app-python in default browser...
🎉  Opening service default/helm-app-rust in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```


### Explanation

Library Charts - chart that can be shared by helm templates in other chats. this can decrease amount of similar code like in any programming language.

Umbrella charts - single chart that can have multiple "subcharts"
