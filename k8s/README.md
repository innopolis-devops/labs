# Kubernetes

## Manual deployment

After manually creating deployment and service, the output of the `kubectl get pods,svc` is as follows:

```plain
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-6f456b58c4-tkf4j   1/1     Running   0          3m50s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.96.28.193   <pending>     5000:30157/TCP   89s
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP          25m
```

## Deployment with Configuration Files

After applying the configuration files, the output of the `kubectl get pods,svc` is as follows:

```plain
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-84bb5fdcfb-cfg4x   1/1     Running   0          92s
pod/app-python-deployment-84bb5fdcfb-thcrn   1/1     Running   0          92s
pod/app-python-deployment-84bb5fdcfb-xk6f8   1/1     Running   0          92s

NAME                         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python-service   LoadBalancer   10.111.144.172   <pending>     5000:31450/TCP   88s
service/kubernetes           ClusterIP      10.96.0.1        <none>        443/TCP          43m
```

And here is the output of the `minikube service --all` command:

```plain
|-----------|--------------------|-------------|---------------------------|
| NAMESPACE |        NAME        | TARGET PORT |            URL            |
|-----------|--------------------|-------------|---------------------------|
| default   | app-python-service |        5000 | http://192.168.49.2:31450 |
|-----------|--------------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🏃  Starting tunnel for service app-python-service.
🏃  Starting tunnel for service kubernetes.
|-----------|--------------------|-------------|------------------------|
| NAMESPACE |        NAME        | TARGET PORT |          URL           |
|-----------|--------------------|-------------|------------------------|
| default   | app-python-service |             | http://127.0.0.1:58409 |
| default   | kubernetes         |             | http://127.0.0.1:58411 |
|-----------|--------------------|-------------|------------------------|
🎉  Opening service default/app-python-service in default browser...
🎉  Opening service default/kubernetes in default browser...
```

As you can see in the screenshot, the address matches the one from the output of the command above:

![result](.images/image.png)
