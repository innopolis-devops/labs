# K8S

## Manual deployment

- Create a Deployment of `app_python` application

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111867-0abd6de4-2861-4d72-94b7-9a65d3afd337.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112568-2f5beb09-b320-4b1d-9853-e302d9027072.png"/>
</p>

- Create a Service of `app_python` application

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111968-ff04c297-8ce8-44cb-82e6-c730a0fab135.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111987-891a21c2-9f64-492d-ad09-aff35a870506.png"/>
</p>

- The output of `kubectl get pods,svc`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112009-92e43fc8-8bca-4588-9468-cadee6aec88d.png"/>
</p>

## Declarative Management of Kubernetes Objects Using Configuration Files

- Create a Deployment of `app_python` application and run `minikube service --all`:
   - `kubectl apply -f app_python`
   - `kubectl get deployments`
   - `kubectl get pods,svc`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112045-7cd48622-df08-456f-9078-76791c4764ca.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112093-2d32f4ad-ba5d-4d4b-b04b-35dc8e7a78f2.png"/>
</p>

- Create a Deployment of `app_kotlin` application and run `minikube service --all`
   - `kubectl apply -f app_kotlin`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112165-45d29f3c-c906-4def-b857-a99fbdc5bebd.png"/>
</p>

- `app_python` has port **59065** and `app_kotlin` has port **59063**

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112201-4376134b-8586-4d50-a8bf-689b858e5cbf.png"/>
</p>

## Theory

- **Ingress** - An object which can provide name-based virtual hosting,
  SSL termination and load balancing via managing external access
  to the services in a cluster.

- **Ingress controller** - A controller which is required to run **Ingress**.
  It maintains the **Ingress** resource.

- **StatefulSet** - An object which deploys pods of stateful applications
  and assigns unique identifiers.

- **DaemonSet** - checks that every node runs a copy of a pod for running
  cluster storage, logs collection or node monitoring daemon.

- **PersistentVolumes** - is a resource which provides an API of abstracts
  details about the storage.

Ref: [https://kubernetes.io/docs/concepts](https://kubernetes.io/docs/concepts)

# Helm

## Create charts 
- Create charts. Set `replicas=2` and ports - `app_python=8000`, `app_kotlin=8080`
   - `helm create charts-app-python`
   - `helm create charts-app-kotlin`
- Install charts.
   - `helm install ./charts-app-python/ --generate-name`
   - `helm install ./charts-app-kotlin/ --generate-name`
```bash
(base) smore@MacBook-Pro-Roman k8s % helm install ./charts-app-python/ --generate-name
NAME: charts-app-python-1667851429
LAST DEPLOYED: Mon Nov  7 23:03:49 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=charts-app-python,app.kubernetes.io/instance=charts-app-python-1667851429" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
(base) smore@MacBook-Pro-Roman k8s % helm install ./charts-app-kotlin/ --generate-name
NAME: charts-app-kotlin-1667851448
LAST DEPLOYED: Mon Nov  7 23:04:08 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=charts-app-kotlin,app.kubernetes.io/instance=charts-app-kotlin-1667851448" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
```

- List charts `helm list`
```bash
NAME                        	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART                  	APP VERSION
charts-app-kotlin-1667850851	default  	1       	2022-11-07 22:54:11.848017 +0300 MSK	deployed	charts-app-kotlin-0.1.0	1.16.0     
charts-app-kotlin-1667851448	default  	1       	2022-11-07 23:04:08.401219 +0300 MSK	deployed	charts-app-kotlin-0.1.0	1.16.0     
charts-app-python-1667850751	default  	1       	2022-11-07 22:52:31.154302 +0300 MSK	deployed	charts-app-python-0.1.0	1.16.0     
charts-app-python-1667851429	default  	1       	2022-11-07 23:03:49.411311 +0300 MSK	deployed	charts-app-python-0.1.0	1.16.0  
```

- Check Workloads page `minikube dashboard`
```bash
🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:53015/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
```

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/200405461-601df0c6-35e5-474d-aebb-1e7c2987923d.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/200405614-08591ca0-5e7f-4e0e-a8c4-e80478707f96.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/200405643-0424d0eb-8a82-41be-aac3-242134c1aaa6.png"/>
</p>

- Check services:
- `minikube service charts-app-python-1667851429`
```bash
(base) smore@MacBook-Pro-Roman k8s % minikube service charts-app-python-1667851429
|-----------|------------------------------|-------------|--------------|
| NAMESPACE |             NAME             | TARGET PORT |     URL      |
|-----------|------------------------------|-------------|--------------|
| default   | charts-app-python-1667851429 |             | No node port |
|-----------|------------------------------|-------------|--------------|
😿  service default/charts-app-python-1667851429 has no node port
🏃  Starting tunnel for service charts-app-python-1667851429.
|-----------|------------------------------|-------------|------------------------|
| NAMESPACE |             NAME             | TARGET PORT |          URL           |
|-----------|------------------------------|-------------|------------------------|
| default   | charts-app-python-1667851429 |             | http://127.0.0.1:53512 |
|-----------|------------------------------|-------------|------------------------|
🎉  Opening service default/charts-app-python-1667851429 in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```
- `minikube service charts-app-kotlin-1667851448`
```bash
(base) smore@MacBook-Pro-Roman k8s % minikube service charts-app-kotlin-1667851448
|-----------|------------------------------|-------------|--------------|
| NAMESPACE |             NAME             | TARGET PORT |     URL      |
|-----------|------------------------------|-------------|--------------|
| default   | charts-app-kotlin-1667851448 |             | No node port |
|-----------|------------------------------|-------------|--------------|
😿  service default/charts-app-kotlin-1667851448 has no node port
🏃  Starting tunnel for service charts-app-kotlin-1667851448.
|-----------|------------------------------|-------------|------------------------|
| NAMESPACE |             NAME             | TARGET PORT |          URL           |
|-----------|------------------------------|-------------|------------------------|
| default   | charts-app-kotlin-1667851448 |             | http://127.0.0.1:53555 |
|-----------|------------------------------|-------------|------------------------|
🎉  Opening service default/charts-app-kotlin-1667851448 in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/200408021-64740d17-8863-4645-bab7-54f79842bfe1.png"/>
</p>

- Run `kubectl get pods,svc`
```bash
NAME                                                READY   STATUS    RESTARTS   AGE
pod/charts-app-kotlin-1667851448-577b68769b-c454g   1/1     Running   0          22m
pod/charts-app-kotlin-1667851448-577b68769b-w6v22   1/1     Running   0          22m
pod/charts-app-python-1667851429-5894fcb7df-hr2gq   1/1     Running   0          22m
pod/charts-app-python-1667851429-5894fcb7df-l9k8n   1/1     Running   0          22m

NAME                                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-kotlin-service             LoadBalancer   10.97.178.231    <pending>     8080:31666/TCP   68m
service/app-python-service             LoadBalancer   10.109.12.132    <pending>     8000:32158/TCP   71m
service/charts-app-kotlin-1667850851   ClusterIP      10.110.157.252   <none>        80/TCP           32m
service/charts-app-kotlin-1667851448   ClusterIP      10.101.173.116   <none>        80/TCP           22m
service/charts-app-python-1667850751   LoadBalancer   10.98.223.47     <pending>     80:30539/TCP     33m
service/charts-app-python-1667851429   ClusterIP      10.103.252.3     <none>        80/TCP           22m
service/kubernetes                     ClusterIP      10.96.0.1        <none>        443/TCP          7d
```
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/200408554-0a15b5ce-eb90-45a9-85de-7e6975d7bf7d.png"/>
</p>

## Theory

- **Library Charts** - it is a chart which defines some templates to help developers follow the DRY principle.
In particular, **Library Charts** defines a "core" which can be used by other charts with slight modifications.

- **Umbrella charts** - A chart which have subcharts like blocks that can be used to build an advanced chart

Refs:
- [Library Charts](https://helm.sh/docs/topics/library_charts/)
- [Complex Charts with Many Dependencies](https://helm.sh/docs/howto/charts_tips_and_tricks/)
- [Helm 3 Umbrella Charts & Standalone Chart Image Tags — An Alternative Approach](https://itnext.io/helm-3-umbrella-charts-standalone-chart-image-tags-an-alternative-approach-78a218d74e2d)
