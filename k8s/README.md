# Kubernetes

Easiest way to set up all of this is to use [minikube](https://minikube.sigs.k8s.io/docs/start/).

How to start:
1. Download kubectl and minikube
2. Start minikube with `minikube start`
3. Deploy docker image `kubectf create deployment devops-time-app --image=justmark0/devopsiu:latest`
4. Expose deployment with load balancer `kubectl expose deployment devops-time-app --type=LoadBalancer --port=8000`

```bash 
❯ kubectl get pods,svc
NAME                                   READY   STATUS              RESTARTS   AGE
pod/devops-time-app-76dc96dc7c-wqvlq   0/1     ContainerCreating   0          30s

NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/devops-time-app   LoadBalancer   10.108.203.98   <pending>     8000:31156/TCP   9s
service/kubernetes        ClusterIP      10.96.0.1       <none>        443/TCP          56s

```

## Automatization

For automatic start I've created deployment.yaml and service.yaml files. 

To apply changes you should run `kubectl apply -f k8s/deployment.yml` and `kubectl apply -f k8s/service.yml`


```bash
❯ kubectl get pods,svc
NAME                                   READY   STATUS             RESTARTS   AGE
pod/devops-time-app-76dc96dc7c-vm5h5   1/1     ImagePullBackOff   0          7m13s
pod/devops-time-app-sz49rb1y11-wqvlq   1/1     ImagePullBackOff   0          7m13s
pod/devops-time-app-qultayus65-3j85j   1/1     ImagePullBackOff   0          7m13s

NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/exposer           LoadBalancer   10.108.42.107   <pending>     80:30654/TCP     4m37s
service/kubernetes        ClusterIP      10.96.0.1       <none>        443/TCP          7m39s
```

```bash
❯ minikube service --all
|-----------|---------|-------------|-----------------------------|
| NAMESPACE |  NAME   | TARGET PORT |             URL             |
|-----------|---------|-------------|-----------------------------|
| default   | exposer |          80 | http://192.168.59.100:30654 |
|-----------|---------|-------------|-----------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service exposer.
🏃  Starting tunnel for service kubernetes.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |           URL          |
|-----------|------------|-------------|------------------------|
| default   | kubernetes |             | http://127.0.0.1:17886 |
| default   | exposer    |             | http://127.0.0.1:17875 |
|-----------|------------|-------------|------------------------|
```

## Definitions

Ingress - tool in Kubernetes that allow to control status of pods, balance load, control network and vm's.

Ingress controller - required part of cluster for Ingress to work. Cluster may have several Ingress contlollers, they helps to manage Ingress (allow to use different hosts or tools).

StatefulSet - is a variant of Deployment it allows unique pods and able to work with different application states on machienes in cluster.

DaemonSet - app that controls pods on each node. Afrer rescaling cluster helps to rearragne pods over the nodes in cluster.

PersistentVolumes - is like Docker volume, it store some information required for pods. It is important to remember that this is common storage over pods.
