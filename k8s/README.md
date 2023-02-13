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

# LAB 10

I installed Helm from script, changed tag and name of the repository, type of service in `values.yml` and port in `deployment.yaml` though it retrieves its value from env variable.

Then I mistook output for advice.

Then

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ helm create helm-app
Creating helm-app
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ helm package helm-app
Successfully packaged chart and saved it to: /home/sokratmillman/IU/devcourse/labs/k8s/helm-app-0.1.0.tgz
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ helm install helm-app ./helm-app-0.1.0.tgz 
NAME: helm-app
LAST DEPLOYED: Mon Feb 13 16:13:42 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace default svc -w helm-app'
  export SERVICE_IP=$(kubectl get svc --namespace default helm-app --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo http://$SERVICE_IP:80
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ export SERVICE_IP=$(kubectl get svc --namespace default helm-app --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
error: error executing template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}": template: output:1:10: executing "output" at <index .status.loadBalancer.ingress 0>: error calling index: index of untyped nil
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ minikube dashboard
🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:46273/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
Found ffmpeg: /opt/yandex/browser-beta/libffmpeg.so
        avcodec: 3877988
        avformat: 3874916
        avutil: 3744870
Ffmpeg version is OK! Let's use it.
[225058:225058:0213/161534.363941:ERROR:isolated_origin_util.cc(74)] Ignoring port number in isolated origin: chrome://custo
Opening in existing browser session.
```

** Dashboard **

Everythin seems healthy
![](/k8s/helm/1.png)
![](/k8s/helm/2.png)

** Output of `minikube service helm-app`: **

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ minikube service helm-app
|-----------|----------|-------------|---------------------------|
| NAMESPACE |   NAME   | TARGET PORT |            URL            |
|-----------|----------|-------------|---------------------------|
| default   | helm-app | http/80     | http://192.168.49.2:32713 |
|-----------|----------|-------------|---------------------------|
🎉  Opening service default/helm-app in default browser...
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ Found ffmpeg: /opt/yandex/browser-beta/libffmpeg.so
        avcodec: 3877988
        avformat: 3874916
        avutil: 3744870
Ffmpeg version is OK! Let's use it.
[234076:234076:0213/162547.571651:ERROR:isolated_origin_util.cc(74)] Ignoring port number in isolated origin: chrome://custo
Opening in existing browser session.
```
opened on http://192.168.49.2:32713.

And list of pods/services reduced as after completing previous lab I deleted everything except kubernetes itself.

```
sokratmillman@sokratmillman:~/IU/devcourse/labs/k8s$ kubectl get pods,svc
NAME                            READY   STATUS    RESTARTS   AGE
pod/helm-app-6c479559d7-c8f6v   1/1     Running   0          13m

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/helm-app     LoadBalancer   10.103.1.112   <pending>     80:32713/TCP   13m
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        115m
```