# Lab 9 & 10
## HowToStart



How to start:

1. Download kubectl and minikube

2. Start minikube with `minikube start`
3. Run `kubectl create deployment devops-time-app --image=mikadonia/py_app:latest`
4. kubectl get deployments:
```
NAME  READY UP-TO-DATE AVAILABLE AGE

devops-time-app 1/1 1  1 2m11s
```
5. Create a Service `kubectl expose deployment devops-time-app --type=LoadBalancer --port=8000`

6. `kubectl get services`
```
NAME  TYPE CLUSTER-IP EXTERNAL-IP PORT(S)  AGE

devops-time-app LoadBalancer 10.109.83.68 <pending> 8000:30512/TCP 51s

kubernetes  ClusterIP  10.96.0.1  <none>  443/TCP  10m
```
7. `kubectl get pods`
```
NAME READY STATUS  RESTARTS AGE

devops-time-app-857c68c879-r7rsr 1/1 Running 0  7m8s
```
8. `kubectl get pods,svc`
```
NAME READY STATUS  RESTARTS AGE

pod/devops-time-app-857c68c879-r7rsr 1/1 Running 0  9m5s

  

NAME  TYPE CLUSTER-IP EXTERNAL-IP PORT(S)  AGE

service/devops-time-app LoadBalancer 10.109.83.68 <pending> 8000:30512/TCP 4m51s

service/kubernetes  ClusterIP  10.96.0.1  <none>  443/TCP  14m
```
9. Remove `deployment` and `service` that you created.
`kubectl delete services devops-time-app`
`kubectl delete deployment devops-time-app

##  Automatization
1. Create deployment.yaml and service.yaml files
2. Apply changes
`kubectl apply -f deployment.yml`
`kubectl apply -f service.yml`
3. Output of `kubectl get pods,svc`
```
NAME READY STATUS  RESTARTS AGE

pod/devops-time-app-5f4db7bc46-47j6q 1/1 Running 0  55s

pod/devops-time-app-5f4db7bc46-cjt46 1/1 Running 0  55s

pod/devops-time-app-5f4db7bc46-dqj4q 1/1 Running 0  55s

  

NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S)  AGE

service/exposer  LoadBalancer 10.97.186.62 <pending> 80:31620/TCP 15s

service/kubernetes ClusterIP  10.96.0.1  <none>  443/TCP  29m
```
4. `minikube service --all`
```
|-----------|---------|-------------|---------------------------|

| NAMESPACE |  NAME | TARGET PORT |  URL  |

|-----------|---------|-------------|---------------------------|

| default | exposer |  80 | http://172.16.244.6:31620 |

|-----------|---------|-------------|---------------------------|

|-----------|------------|-------------|--------------|

| NAMESPACE |  NAME  | TARGET PORT | URL  |

|-----------|------------|-------------|--------------|

| default | kubernetes | | No node port |

|-----------|------------|-------------|--------------|

😿  service default/kubernetes has no node port

🎉  Opening service default/exposer in default browser...
```

## Helm 
1. Run `helm create devops-time-app`
2. Edit values.yaml
3. `minikube service devops-time-app`
4. Output of `kubectl get pods,svc`

```
NAME                                   READY   STATUS    RESTARTS   AGE
pod/devops-time-app-75c9c67579-p65f8   1/1     Running   0          66s

NAME                      TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/devops-time-app   LoadBalancer   10.98.44.114   <pending>     8000:32524/TCP   57s
service/kubernetes        ClusterIP      10.96.0.1      <none>        443/TCP          22m

```

Also charts are in directory k8s (screenshots)
