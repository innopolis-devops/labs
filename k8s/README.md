# Kubernetes

## Contents

- [Manual deployment](#manual-deployment)
- [Config files approach](#config-files-approach)
- [Bonus part](#bonus-part)
  - [Second app](#run-the-second-app)
  - [Theory task](#theory-task)

## Manual deployment

```sh
# Create a deployment
kubectl create deployment python-app --image=ntdesmond/iu-devops-python:latest
# Create a service to expose the port
kubectl expose deployment python-app --type=LoadBalancer --port=8000
```

Output of `kubectl get pods,svc`:

```text
NAME                             READY   STATUS    RESTARTS   AGE
pod/python-app-b87fdbfbf-kkp4k   1/1     Running   0          16m

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          88m
service/python-app   LoadBalancer   10.106.243.54   <pending>     8000:30122/TCP   11m
```

After running `minikube service python-app` I get the URL to see the app working:

```text
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | python-app |        8000 | http://192.168.49.2:30122 |
|-----------|------------|-------------|---------------------------|
🏃  Starting tunnel for service python-app.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | python-app |             | http://127.0.0.1:42231 |
|-----------|------------|-------------|------------------------|
🎉  Opening service default/python-app in default browser...
👉  http://127.0.0.1:42231
❗  Because you are using a Docker driver on linux, the terminal needs to be open to run it.
```

The app is up, though it returns `Internal Server Error` since the app requires `redis` to be run.

### Cleanup

Ran this command to delete the deployment and service:

```sh
kubectl delete deployment,svc python-app
```

## Config files approach

### Setup

I've added the required [`deployment.yml`](./python_app/deployment.yml) and [`service.yml`](./python_app/service.yml) files

I have also added redis configuration, see [`redis`](./redis/) folder.

Now let's test the app:

```sh
kubectl apply -f ./redis/ -f ./python_app/  
```

Output of `kubectl get pods,svc`:

```text
NAME                                         READY   STATUS    RESTARTS   AGE
pod/python-app-deployment-6c6c969b4c-fmpl4   1/1     Running   0          20s
pod/python-app-deployment-6c6c969b4c-kk28k   1/1     Running   0          20s
pod/python-app-deployment-6c6c969b4c-ww58z   1/1     Running   0          20s
pod/redis-deployment-56bc99cc99-4wbdm        1/1     Running   0          42s

NAME                         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/kubernetes           ClusterIP      10.96.0.1        <none>        443/TCP          3h27m
service/python-app-service   LoadBalancer   10.106.90.6      <pending>     8000:30435/TCP   42s
service/redis                LoadBalancer   10.101.183.201   <pending>     6379:32750/TCP   42s
```

We can see the 3 replicas of the python app and a single redis pod being created.

### Testing

Output of `minikube service --all`:

```text
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | python-app-service |        8000 | http://192.168.49.2:30435 |
|-----------|--------------------|-------------|---------------------------|
|-----------|-------|-------------|---------------------------|
| NAMESPACE | NAME  | TARGET PORT |            URL            |
|-----------|-------|-------------|---------------------------|
| default   | redis |        6379 | http://192.168.49.2:32750 |
|-----------|-------|-------------|---------------------------|
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service python-app-service.
🏃  Starting tunnel for service redis.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | kubernetes         |             | http://127.0.0.1:43205 |
| default   | python-app-service |             | http://127.0.0.1:44653 |
| default   | redis              |             | http://127.0.0.1:43253 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/kubernetes in default browser...
👉  http://127.0.0.1:43205
🎉  Opening service default/python-app-service in default browser...
👉  http://127.0.0.1:44653
🎉  Opening service default/redis in default browser...
👉  http://127.0.0.1:43253
❗  Because you are using a Docker driver on linux, the terminal needs to be open to run it.
```

Screenshot of the app at `http://127.0.0.1:44653`:
![App is running!](https://i.imgur.com/TH8DiuK.png)

## Bonus part

### Run the second app

See [`ts_app`](./ts_app/) folder for deployment and service files.

```sh
kubectl apply -f ./ts_app/ 
```

#### `kubectl get pods,svc` output

```text
NAME                                         READY   STATUS    RESTARTS   AGE
pod/python-app-deployment-6c6c969b4c-fmpl4   1/1     Running   0          9m43s
pod/python-app-deployment-6c6c969b4c-kk28k   1/1     Running   0          9m43s
pod/python-app-deployment-6c6c969b4c-ww58z   1/1     Running   0          9m43s
pod/redis-deployment-56bc99cc99-4wbdm        1/1     Running   0          10m
pod/ts-app-deployment-647bd7d77f-jzrqz       1/1     Running   0          117s
pod/ts-app-deployment-647bd7d77f-k2wsw       1/1     Running   0          117s
pod/ts-app-deployment-647bd7d77f-p8mht       1/1     Running   0          117s

NAME                         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/kubernetes           ClusterIP      10.96.0.1        <none>        443/TCP          3h37m
service/python-app-service   LoadBalancer   10.106.90.6      <pending>     8000:30435/TCP   10m
service/redis                LoadBalancer   10.101.183.201   <pending>     6379:32750/TCP   10m
service/ts-app-service       LoadBalancer   10.99.169.204    <pending>     3000:31943/TCP   117s
```

#### `minikube service ts-app-service` output

```text
|-----------|----------------|-------------|---------------------------|
| NAMESPACE |      NAME      | TARGET PORT |            URL            |
|-----------|----------------|-------------|---------------------------|
| default   | ts-app-service |        3000 | http://192.168.49.2:31943 |
|-----------|----------------|-------------|---------------------------|
🏃  Starting tunnel for service ts-app-service.
|-----------|----------------|-------------|------------------------|
| NAMESPACE |      NAME      | TARGET PORT |          URL           |
|-----------|----------------|-------------|------------------------|
| default   | ts-app-service |             | http://127.0.0.1:42977 |
|-----------|----------------|-------------|------------------------|
🎉  Opening service default/ts-app-service in default browser...
👉  http://127.0.0.1:42977
❗  Because you are using a Docker driver on linux, the terminal needs to be open to run it.
```

#### Screenshot of the running app

![Second app running](https://i.imgur.com/ucyIIoE.png)

### Theory task

**Ingress** — a resource that handles external requests to the services in a cluster (e.g., HTTP). Depends on a running **Ingress controller** to work.

**Ingress controller** — a specific service that actually handles the requests according to the Ingress rules.

**StatefulSet** — an object that manages pods, assigning a unique id to them. Allows to perform ordered deployment, scaling, and updates.

**DaemonSet** — a resource that ensures the nodes are running the same pods, which allows to perform the same task on multiple nodes at once, e.g., logging and monitoring.

**PersistentVolumes** — volumes that do not depend on the pods that use them, i.e., they will persist if the pods get deleted.
