# k![image](https://user-images.githubusercontent.com/63815121/199133688-a53868f9-8cca-4182-b6f9-f99bd6d07d55.png)netes
## 👍 [lab 09](#getting-started)
## 👍 [lab 10](#helm)

### getting started
1. install [`minicube`](https://minikube.sigs.k8s.io/docs/start/) and [`kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/) using any prefferable way
2. `minikube start`

### create deployment and service
1. create deployment by executing:
```shell
kubectl create deployment pink-time --image=molberte/devops-labs:latest
```
2. create service by exposing container:
```shell
kubectl expose deployment pink-time --type=LoadBalancer --port=5000
```
3. run `kubectl get pods,svc`
```shell
>kubectl get pods,svc
NAME                             READY   STATUS    RESTARTS   AGE
pod/pink-time-749c4f5655-kqqfj   1/1     Running   0          32m

NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          44m
service/pink-time    LoadBalancer   10.111.180.223   <pending>     5000:30144/TCP   62s
```

### proof of work
👏👏👏👏👏👏
![image](https://user-images.githubusercontent.com/63815121/199133739-ae2f726b-4d84-479b-a4e0-d9fcab928f8a.png)

👏👏👏👏👏👏

### clean up 🧹
`kubectl delete service pink-time`

`kubectl delete deployment pink-time`

## automation 
1. `deployment.yml` and `service.yml` file were created for automation
2. run `kubectl apply -f k8s/deployment.yml` and `kubectl apply -f k8s/service.yml` to apply changes
3. `kubectl get pods,svc`
```shell
>kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/devops-app-569b8974f9-f4cx7   1/1     Running   0          23s
pod/devops-app-569b8974f9-pm2sx   1/1     Running   0          23s
pod/devops-app-569b8974f9-sdcvr   1/1     Running   0          23s

NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/exposer      LoadBalancer   10.110.153.245   <pending>     80:31748/TCP   12s
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP        85m
```

4. `minikube service --all`
```shell
>minikube service --all
|-----------|---------|-------------|---------------------------|
| NAMESPACE |  NAME   | TARGET PORT |            URL            |
|-----------|---------|-------------|---------------------------|
| default   | exposer |          80 | http://192.168.49.2:31748 |
|-----------|---------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
* service default/kubernetes has no node port
* Starting tunnel for service exposer.
* Starting tunnel for service kubernetes.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | exposer    |             | http://127.0.0.1:55978 |
| default   | kubernetes |             | http://127.0.0.1:55980 |
|-----------|------------|-------------|------------------------|
```

### prrrororoooof offf workkk
![image](https://user-images.githubusercontent.com/63815121/199133806-b2c96d79-8898-4b17-8689-7d61bef0fa9b.png)

🥇🥇🥇🥇🥇

### some definitions that my teammates nicely explained to me

**ingress** - kubernetes feature to manage status of pods, balance load, control network and virtual machines

**ingress controller** - must-have-running controller in order to run ingress

**StatefulSet** - helps to manage stateful applications (the deployment and scaling of a set of unique pods)

**DaemonSet** - fella that guarantees that at least some nodes run a copy of a pod

**PersistentVolumes** - stores some information required for pod similarly to docker volume

## helm

1. install [`helm`](https://helm.sh/docs/intro/install/)
2. create a template with `helm create pink-time`
3. change it a bit to match your configs

####  `> minikube service pink-time` output:
```shell
|-----------|-----------|-------------|---------------------------|
| NAMESPACE |   NAME    | TARGET PORT |            URL            |
|-----------|-----------|-------------|---------------------------|
| default   | pink-time |          80 | http://192.168.49.2:32666 |
|-----------|-----------|-------------|---------------------------|
* Starting tunnel for service pink-time.
|-----------|-----------|-------------|------------------------|
| NAMESPACE |   NAME    | TARGET PORT |          URL           |
|-----------|-----------|-------------|------------------------|
| default   | pink-time |             | http://127.0.0.1:63072 |
|-----------|-----------|-------------|------------------------|
```

#### `> kubectl get pods,svc` output:
```shell
NAME                             READY   STATUS    RESTARTS   AGE
pod/pink-time-569b8974f9-64577   1/1     Running   0          6m11s
pod/pink-time-569b8974f9-8g64v   1/1     Running   0          6m11s
pod/pink-time-569b8974f9-p58hp   1/1     Running   0          6m11s

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP        7d1h
service/pink-time    LoadBalancer   10.97.172.209   <pending>     80:32666/TCP   6m2s
```

#### in-browser output:
![image](https://user-images.githubusercontent.com/63815121/200444292-8ad44be8-ac1e-4359-84a3-3e0b5b904b42.png)


#### `> minikube dashboard` output:
![image](https://user-images.githubusercontent.com/63815121/200444333-f636c333-1a47-483f-a68d-58c49a586d8f.png)

#### meanwhile `workloads` also look pretty well:
![image](https://user-images.githubusercontent.com/63815121/200444363-e4608a53-53bd-4100-be81-613000a8de05.png)



well done lab, thank you for following me and careful reading 🤗🤗🥰

#### good luck with cleaning up!! 🎉🧽

`helm uninstall pink-time` for helm

`kubectl delete -f ./config/service.yaml` and `kubectl delete -f ./config/deployment.yaml` for service and deployment

`minikube stop` or `minikube delete` for minikube
