# K8S

## Output of `kubectl get pods,svc`

```bash
kubectl get pod,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-7b6b7c6c78-4pdxw   1/1     Running   0          11m
pod/app-python-7b6b7c6c78-8z799   1/1     Running   0          12m
pod/app-python-7b6b7c6c78-ng5k9   1/1     Running   0          11m
pod/hello-node-857856f469-cnn4h   1/1     Running   0          22m

NAME                      TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/hello-node        LoadBalancer   10.107.137.166   <pending>     5000:31762/TCP   21m
service/kubernetes        ClusterIP      10.96.0.1        <none>        443/TCP          62m
service/web-app-service   LoadBalancer   10.111.61.89     <pending>     5000:30133/TCP   46m
```

## Output of `minikube service --all`

```bash
 minikube service --all
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | hello-node |        5000 | http://192.168.49.2:31762 |
|-----------|------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|-----------------|-------------|---------------------------|
| NAMESPACE |      NAME       | TARGET PORT |            URL            |
|-----------|-----------------|-------------|---------------------------|
| default   | web-app-service |        5000 | http://192.168.49.2:30133 |
|-----------|-----------------|-------------|---------------------------|
🏃  Starting tunnel for service hello-node.
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service web-app-service.
|-----------|-----------------|-------------|------------------------|
| NAMESPACE |      NAME       | TARGET PORT |          URL           |
|-----------|-----------------|-------------|------------------------|
| default   | hello-node      |             | http://127.0.0.1:64878 |
| default   | kubernetes      |             | http://127.0.0.1:64880 |
| default   | web-app-service |             | http://127.0.0.1:64882 |
|-----------|-----------------|-------------|------------------------|
🎉  Opening service default/hello-node in default browser...
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/web-app-service in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

![image](img.png)

### P.S. I have done the cleanup of hello-node, but later recreated it to check the description, so the lab is done correctly

## Lab 10

### `kubectl get pods,svc`

```bash
kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS        AGE
pod/app-python-54b6bff94-sbc56    1/1     Running   0               2m45s
pod/hello-node-857856f469-cnn4h   1/1     Running   1 (8m31s ago)   6d19h

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
service/app-python   ClusterIP   10.107.142.0   <none>        80/TCP    2m45s
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP   6d20h
```

## Screenshot of the dashboard

![dashboard](dashboard.png)
