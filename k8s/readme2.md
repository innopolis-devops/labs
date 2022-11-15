# k8s
## Pre
1. install docker and provide rights
2. insrall kubectl
3. install minicube

## Mannual deploy of 'app_python'

```
    /home/ease_/u/labs/k8s    lab9 !2 ?3  minikube start                                           ✔
😄  minikube v1.28.0 on Arch 21.3.7
✨  Automatically selected the docker driver
📌  Using Docker driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.25.3 preload ...
    > preloaded-images-k8s-v18-v1...:  385.44 MiB / 385.44 MiB  100.00% 885.12
    > gcr.io/k8s-minikube/kicbase:  386.27 MiB / 386.27 MiB  100.00% 794.27 KiB
    > gcr.io/k8s-minikube/kicbase:  0 B [__________________________] ?% ? p/s ?
    > gcr.io/k8s-minikube/kicbase:  0 B [______________________] ?% ? p/s 4m30s
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.25.3 on Docker 20.10.20 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
    /home/ease_/u/labs/k8s    lab9 !3 ?3                                               ✔  14m 27s 
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl create deployment app-python --image=easeln/dockerhub:app_python_v01

deployment.apps/app-python created
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl get deployment app-python                        ✔

NAME         READY   UP-TO-DATE   AVAILABLE   AGE
app-python   0/1     1            0           9s
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl get deployment app-python                        ✔

NAME         READY   UP-TO-DATE   AVAILABLE   AGE
app-python   0/1     1            0           34s
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl get deployment app-python                        ✔

NAME         READY   UP-TO-DATE   AVAILABLE   AGE
app-python   1/1     1            1           83s
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl expose deployment app-python --type=LoadBalancer --port=8000

service/app-python exposed
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl get pods,svc                                     ✔

NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-5c64b68498-2kmpg   1/1     Running   0          98s

NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.106.142.144   <pending>     8000:32748/TCP   17s
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          112s

    /home/ease_/u/labs/k8s    lab9 !3 ?2  minikube delete                           INT ✘  1m 14s 

🔥  Deleting "minikube" in docker ...
🔥  Deleting container "minikube" ...
🔥  Removing /home/easel/.minikube/machines/minikube ...
💀  Removed all traces of the "minikube" cluster.

```

## Deploy 'app_python' by config files
```
    /home/ease_/u/labs/k8s    lab9 !3 ?2  minikube delete                           INT ✘  1m 14s 

🔥  Deleting "minikube" in docker ...
🔥  Deleting container "minikube" ...
🔥  Removing /home/easel/.minikube/machines/minikube ...
💀  Removed all traces of the "minikube" cluster.
    /home/ease_/u/labs/k8s    lab9 !3 ?2                                                    ✔  5s 
    /home/ease_/u/labs/k8s    lab9 !3 ?2                                                       INT ✘
    /home/ease_/u/labs/k8s    lab9 !3 ?2  ls                                                   INT ✘
 deployment.yml   readme.md  'Screenshot from 2022-11-01 05-08-08.png'
 google-chrome    screens     service.yml
    /home/ease_/u/labs/k8s    lab9 !3 ?3  minikube start                                           ✔
😄  minikube v1.28.0 on Arch 21.3.7
✨  Automatically selected the docker driver
📌  Using Docker driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.25.3 on Docker 20.10.20 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl apply -f deployment.yml                  ✔  53s 
deployment.apps/app-python-deployment created
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl apply -f service.yml                             ✔
service/app-python-service created
    /home/ease_/u/labs/k8s    lab9 !3 ?3  kubectl get pods,svc                                     ✔
NAME                                        READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-9496bf59d-4fcv5   1/1     Running   0          118s
pod/app-python-deployment-9496bf59d-5g52m   1/1     Running   0          118s
pod/app-python-deployment-9496bf59d-lrtb9   1/1     Running   0          118s

NAME                         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.103.129.155   <pending>     8000:31048/TCP   111s
service/kubernetes           ClusterIP      10.96.0.1        <none>        443/TCP          2m15s
    /home/ease_/u/labs/k8s    lab9 !3 ?3  minikube service --all                                   ✔
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        8000 | http://192.168.49.2:31048 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-service in default browser...
    /home/ease_/u/labs/k8s    lab9 !3 ?3  minikube service app-python-service --url                ✔
http://192.168.49.2:31048
    /home/ease_/u/labs/k8s    lab9 !3 ?3  minikube dashboard                                   INT ✘
🔌  Enabling dashboard ...
    ▪ Using image docker.io/kubernetesui/dashboard:v2.7.0
    ▪ Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
💡  Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server


🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:33531/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...


```
P.S. lately i understand that there are not everythng is clear so i added some screens and this second readme
