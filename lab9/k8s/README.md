```console
> kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-6596dd5997-j9btf   1/1     Running   0          81m

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.103.175.90   <pending>     8001:31792/TCP   75m
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          3h53m
```

```console
> kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-85f94bf896-vkxkh   1/1     Running   0          12m

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.108.51.175   <pending>     8001:31779/TCP   8m35s
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          4h10m
```

```console
> minikube service --all
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        8001 | http://192.168.49.2:31779 |
|-----------|------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python.
🏃  Starting tunnel for service kubernetes.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | app-python |             | http://127.0.0.1:63272 |
| default   | kubernetes |             | http://127.0.0.1:63278 |
|-----------|------------|-------------|------------------------|
🎉  Opening service default/app-python in default browser...
🎉  Opening service default/kubernetes in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

![Lab9](../screenshots/lab-9.png)