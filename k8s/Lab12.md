# Lab 12

## Config Map

```bash
$ kubectl get po
app-python-webapp-5d4d4664dd-4fq6n   1/1     Running   1 (7m5s ago)    9m39s
app-python-webapp-5d4d4664dd-7m6mx   1/1     Running   1 (7m6s ago)    9m39s
app-python-webapp-5d4d4664dd-shfrl   1/1     Running   1 (7m17s ago)   9m39s
app-rust-webapp-6f69f98fdd-8q6km     1/1     Running   0               9m39s
app-rust-webapp-6f69f98fdd-gwqdg     1/1     Running   0               9m39s
app-rust-webapp-6f69f98fdd-mbxtm     1/1     Running   0               9m39s

$ kubectl exec app-python-webapp-5d4d4664dd-4fq6n --container webapp -- cat /app/config/config.json
{
  "aboba": "ඞ",
  "♂": "( ͡° ͜ʖ ͡°)"
}
```

## Persistency

Note: each time k8s or a user pings a services it records new session som the amount of sessions is big

```bash
$ kubectl get pods,svc
NAME                                   READY   STATUS    RESTARTS   AGE
pod/app-python-webapp-66fd645b-4b9wp   1/1     Running   0          91s
pod/app-python-webapp-66fd645b-rqtfz   1/1     Running   0          2m12s
pod/app-python-webapp-66fd645b-scl9m   1/1     Running   0          2m52s
pod/app-rust-webapp-7f9d4765d8-mfm7l   1/1     Running   0          2m34s
pod/app-rust-webapp-7f9d4765d8-qjbsk   1/1     Running   0          2m52s
pod/app-rust-webapp-7f9d4765d8-sjlf2   1/1     Running   0          2m22s

NAME                        TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)        AGE
service/app-python-webapp   LoadBalancer   10.103.157.215   10.103.157.215   80:30330/TCP   26m
service/app-rust-webapp     LoadBalancer   10.108.128.20    10.108.128.20    80:31881/TCP   26m
service/kubernetes          ClusterIP      10.96.0.1        <none>           443/TCP        3h43m

$ http 10.103.157.215/visits
HTTP/1.1 200 OK
content-length: 2
content-type: text/plain; charset=utf-8
date: Mon, 21 Nov 2022 12:56:03 GMT
server: uvicorn

52

$ http 10.108.128.20/visits
HTTP/1.1 200 OK
content-length: 2
content-type: text/plain; charset=utf-8
date: Mon, 21 Nov 2022 12:56:07 GMT
permissions-policy: interest-cohort=()
server: Rocket
x-content-type-options: nosniff
x-frame-options: SAMEORIGIN

97

$ kubectl scale deployment app-python-webapp app-rust-webapp --replicas 0
deployment.apps/app-python-webapp scaled
deployment.apps/app-rust-webapp scaled

$ kubectl get pods
No resources found in default namespace.

$ kubectl scale deployment app-python-webapp app-rust-webapp --replicas 3
deployment.apps/app-python-webapp scaled
deployment.apps/app-rust-webapp scaled

$ kubectl get pods,svc
NAME                                   READY   STATUS    RESTARTS   AGE
pod/app-python-webapp-66fd645b-cvm9h   1/1     Running   0          91s
pod/app-python-webapp-66fd645b-sm2xh   1/1     Running   0          91s
pod/app-python-webapp-66fd645b-trv67   1/1     Running   0          91s
pod/app-rust-webapp-7f9d4765d8-jxp7n   1/1     Running   0          91s
pod/app-rust-webapp-7f9d4765d8-r6skr   1/1     Running   0          91s
pod/app-rust-webapp-7f9d4765d8-z7452   1/1     Running   0          91s

NAME                        TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)        AGE
service/app-python-webapp   LoadBalancer   10.103.157.215   10.103.157.215   80:30330/TCP   29m
service/app-rust-webapp     LoadBalancer   10.108.128.20    10.108.128.20    80:31881/TCP   29m
service/kubernetes          ClusterIP      10.96.0.1        <none>           443/TCP        3h46m

$ http 10.103.157.215/visits
HTTP/1.1 200 OK
content-length: 2
content-type: text/plain; charset=utf-8
date: Mon, 21 Nov 2022 12:58:37 GMT
server: uvicorn

81

$ http 10.108.128.20/visits
HTTP/1.1 200 OK
content-length: 3
content-type: text/plain; charset=utf-8
date: Mon, 21 Nov 2022 12:58:46 GMT
permissions-policy: interest-cohort=()
server: Rocket
x-content-type-options: nosniff
x-frame-options: SAMEORIGIN

142

$ kubectl exec app-python-webapp-66fd645b-cvm9h --container webapp -it -- mount | grep /app
/dev/vda1 on /app/config type ext4 (ro,relatime)
/dev/vda1 on /app/volume type ext4 (rw,relatime)

$ kubectl exec app-rust-webapp-7f9d4765d8-jxp7n --container webapp -it -- mount | grep /app
/dev/vda1 on /app/config type ext4 (ro,relatime)
/dev/vda1 on /app/volume type ext4 (rw,relatime)
```

## Bonus

### StatefulSet

From other lab report:
> An alternative for Deployment for stateful application. Compared to Deployment, it also includes pvc management.

### Headless service

It is a service without load balancer. It exposes pods' ips in k8s dns.

### Persistent Voume

From other lab report:
> A data storage volume (block or filesystem). Can be requested by PersistentVolumeClaim or manually and then assigned to a pod.
