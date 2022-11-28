# Lab 13

## StatefulSet

```bash
$ kubectl get po,sts,svc,pvc
NAME                      READY   STATUS    RESTARTS   AGE
pod/app-python-webapp-0   1/1     Running   0          2m49s
pod/app-python-webapp-1   1/1     Running   0          101s
pod/app-python-webapp-2   1/1     Running   0          69s
pod/app-rust-webapp-0     1/1     Running   0          2m49s
pod/app-rust-webapp-1     1/1     Running   0          112s
pod/app-rust-webapp-2     1/1     Running   0          105s

NAME                                 READY   AGE
statefulset.apps/app-python-webapp   3/3     2m49s
statefulset.apps/app-rust-webapp     3/3     2m49s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/app-python-webapp   LoadBalancer   10.96.195.135   <pending>     80:32583/TCP   2m49s
service/app-rust-webapp     LoadBalancer   10.106.84.215   <pending>     80:30022/TCP   2m49s
service/kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP        3m13s

NAME                                                                 STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/app-python-webapp-volume-app-python-webapp-0   Bound    pvc-ad644974-15f2-4dc5-b51d-d39f3dd62b9c   64Mi       RWO            standard       2m49s
persistentvolumeclaim/app-python-webapp-volume-app-python-webapp-1   Bound    pvc-7a5d9abc-ca59-4c2f-97ed-1fc72b86b735   64Mi       RWO            standard       101s
persistentvolumeclaim/app-python-webapp-volume-app-python-webapp-2   Bound    pvc-9780e101-9981-4cc8-9adf-bc7bdeca253b   64Mi       RWO            standard       69s
persistentvolumeclaim/app-rust-webapp-volume-app-rust-webapp-0       Bound    pvc-4656759c-3c57-491a-b834-e0a5fcaced36   64Mi       RWO            standard       2m49s
persistentvolumeclaim/app-rust-webapp-volume-app-rust-webapp-1       Bound    pvc-e040d520-98d8-47a5-9129-478a16ea4883   64Mi       RWO            standard       112s
persistentvolumeclaim/app-rust-webapp-volume-app-rust-webapp-2       Bound    pvc-1ba1aed8-ef68-45c6-96e5-fc9888b53a42   64Mi       RWO            standard       105s

$ minikube service --all
|-----------|-------------------|-------------|-----------------------------|
| NAMESPACE |       NAME        | TARGET PORT |             URL             |
|-----------|-------------------|-------------|-----------------------------|
| default   | app-python-webapp | http/80     | http://192.168.39.100:32583 |
|-----------|-------------------|-------------|-----------------------------|
|-----------|-----------------|-------------|-----------------------------|
| NAMESPACE |      NAME       | TARGET PORT |             URL             |
|-----------|-----------------|-------------|-----------------------------|
| default   | app-rust-webapp | http/80     | http://192.168.39.100:30022 |
|-----------|-----------------|-------------|-----------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
🎉  Opening service default/app-python-webapp in default browser...
🎉  Opening service default/app-rust-webapp in default browser...
```

```bash
$ parallel --gnu 'kubectl exec {} --container webapp -- cat /app/volume/visits; echo' ::: pod/app-{python,rust}-webapp-{0..2}
50

50

74
49

71
69
```

The amount of visits in each pod is different because each pod has its own associated pvc & pv.

## Ordering

We don't need ordering because our app is independent from replicas (e.g. replicas are not synchronized in any way). We can make StatefulSet controller launch pods in parallel by adding `podManagementPolicy: Parallel`

## Update strategies

### Recreate update strategy

1. Destroy all pods of the old app
2. Create the pods with the new version of an app

### Rolling update strategy

Update pods one by one to the new version.

See the chart
![chart](https://www.educative.io/api/page/5744315014840320/image/download/5966421029289984)

### Canary update

Rollout some of the pods to the new version (starting from minority) and gradually increase the number of pods on the new version while collecting feedback from users. 
