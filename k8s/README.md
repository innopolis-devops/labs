# K8s

## manual

```bash
$ kubectl get deployments                   
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
py     1/1     1            1           2m13s

$ kubectl get services
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          7m56s
py           LoadBalancer   10.99.160.29   <pending>     5000:31590/TCP   27s

$ kubectl get pods               
NAME                  READY   STATUS    RESTARTS   AGE
py-658bb98896-2ggcp   1/1     Running   0          2m50s
```

## manifest

```bash
kubectl get pods,svc      
NAME                      READY   STATUS    RESTARTS   AGE
pod/py-7c5b75df97-627m5   1/1     Running   0          21m
pod/py-7c5b75df97-wqdgz   1/1     Running   0          21m
pod/py-7c5b75df97-z8t7r   1/1     Running   0          21m

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP        22m
service/py-service   LoadBalancer   10.101.175.79   <pending>     80:31990/TCP   21m

minikube service --all                                lab9 1 3 
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|------------|-------------|----------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL             |
|-----------|------------|-------------|----------------------------|
| default   | py-service |          80 | http://192.168.39.65:31990 |
|-----------|------------|-------------|----------------------------|
🎉  Opening service default/py-service in default browser...
```
