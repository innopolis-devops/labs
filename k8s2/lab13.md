```
kubectl get po,sts,svc,pvc                              ✔  minikube ⎈
NAME                              READY   STATUS    RESTARTS   AGE
pod/app-python-app-python-web-0   1/1     Running   0          31s
pod/app-python-app-python-web-1   1/1     Running   0          31s


NAME                                         READY   AGE
statefulset.apps/app-python-app-python-web   2/2     31s

NAME                                TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/app-python-app-python-web   LoadBalancer   10.104.0.194   <pending>     8080:31472/TCP   31s
service/kubernetes                  ClusterIP      10.96.0.1      <none>        443/TCP          173m
service/nginx                       ClusterIP      None           <none>        80/TCP           7m53s

NAME                                                STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/app-python-app-python-web-0   Bound    pvc-99716dcc-472a-46ad-b6d2-095e6567e302   1Gi        RWO            standard       14h
persistentvolumeclaim/app-python-app-python-web-1   Bound    pvc-99716dcc-472a-46ad-b6d2-095e6567e302   1Gi        RWO            standard       14h
```

```
kubectl exec app-python-app-python-web-0 -- cat /app/moscow_time/volume/visits.txt        ✔  minikube ⎈
23:32:33
23:32:37
23:32:50
23:32:54
23:32:54
23:33:02
23:33:02
23:33:11
23:33:11
23:33:12
23:33:12
23:33:13
23:33:13
23:33:15
23:33:15
23:33:15
```

```
kubectl exec app-python-app-python-web-0 -- cat /app/moscow_time/volume/visits.txt | wc -l   ✔  minikube ⎈
15
```


```
kubectl exec app-python-app-python-web-1 -- cat /app/moscow_time/volume/visits.txt        ✔  minikube ⎈
23:32:32
23:32:36
23:32:36
23:32:36
23:32:49
23:32:53
23:32:53
23:32:53
23:33:01
23:33:10
23:33:10
23:33:10
23:33:10
23:33:10
23:33:12
23:33:12
23:33:12
23:33:13
23:33:14
23:33:14
23:33:14
23:33:14
```

```
kubectl exec app-python-app-python-web-1 -- cat /app/moscow_time/volume/visits.txt | wc -l   ✔  minikube ⎈
21
```

I think there are difference visites in each pod has because every has own volume.
We can use podManagementPolicy: Parallel due to the pods independency
