# K8s

## Manual

From [guide](https://minikube.sigs.k8s.io/docs/start/) and [guide](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-deployment)

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl create deployment manual-flask --image=sokratmillman/flask_app:latest
deployment.apps/manual-flask created
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl expose deployment manual-flask --type=LoadBalancer --port=8068
service/manual-flask exposed
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl get services
NAME           TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
kubernetes     ClusterIP      10.96.0.1     <none>        443/TCP          12m
manual-flask   LoadBalancer   10.99.78.78   <pending>     8068:30829/TCP   108s
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl get pods,svc
NAME                               READY   STATUS    RESTARTS   AGE
pod/manual-flask-6f8cc7945-44slf   1/1     Running   0          4m36s

NAME                   TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
service/kubernetes     ClusterIP      10.96.0.1     <none>        443/TCP          12m
service/manual-flask   LoadBalancer   10.99.78.78   <pending>     8068:30829/TCP   2m16s

```

Clean up:
```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl delete service manual-flask
service "manual-flask" deleted
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl delete deployment manual-flask
deployment.apps "manual-flask" deleted
```

## Automatize

Create app_python folder with `deployment.yml` inside.

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl apply -f ./app_python
deployment.apps/auto-deploy created
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/auto-deploy-58cb4fdbd-k7xzz   1/1     Running   0          30s
pod/auto-deploy-58cb4fdbd-kgsng   1/1     Running   0          30s
pod/auto-deploy-58cb4fdbd-mrt4x   1/1     Running   0          30s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   34m
```

For some reason, I faced some bugs. In order to solve them, I deleted all the deployments and services using `kubectl delete deployments --all`

I assumed that the port couldn't be exposed. As it turned out, I might be right. However, for the next time, I ran `kubectl apply -f ./app_python` with two files together, not separately.

Here is the output:

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl apply -f ./app_python
deployment.apps/flask-server-deployment created
service/flask-server-service created
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ minikube service --all
|-----------|----------------------|-------------|---------------------------|
| NAMESPACE |         NAME         | TARGET PORT |            URL            |
|-----------|----------------------|-------------|---------------------------|
| default   | flask-server-service |        5000 | http://192.168.49.2:31082 |
|-----------|----------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/flask-server-service in default browser...
Found ffmpeg: /opt/yandex/browser-beta/libffmpeg.so
        avcodec: 3877988
        avformat: 3874916
        avutil: 3744870
Ffmpeg version is OK! Let's use it.
```

Here are screenshots:

![](/k8s/screenshots/output.png)
![](/k8s/screenshots/Screenshot.png)