## Lab9

### `kubectl -n lab9 get svc,pod`
```
NAME                         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
service/app-python-service   ClusterIP   10.96.86.218   <none>        8080/TCP   3m21s

NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-76cc487bf4-w8p22   1/1     Running   0          4m11s
```

### `kubectl -n lab9 port-forward service/app-python-service 8080:8080`
```
Forwarding from 127.0.0.1:1232 -> 8080
Forwarding from [::1]:1232 -> 8080
Handling connection for 1232
```

![image](assets/lab9.png)