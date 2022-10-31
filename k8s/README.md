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