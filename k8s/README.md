# k8s lab report 

## Manual deployment

I downloaded kubectl and minikube,
started minikube. After kubectl was configured to use "minikube" cluster

I deployed docker image
`kubectl create deployment clocker --image=254689393895236/clock-clock:v1.0.0`

after exposed deployment
`kubectl expose deployment clocker --type=LoadBalancer --port=5000`

then I checked the service availability
![webapp](pics/img.png)
![webapp](pics/img_1.png)

url addresses are identical

the output from
`kubectl get pods,svc` command:

```
$ kubectl get pods,svc
NAME                           READY   STATUS    RESTARTS   AGE
pod/clocker-55d986c7bb-wrh5k   1/1     Running   0          4m52s

NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/clocker      LoadBalancer   10.109.126.103   <pending>     5000:32188/TCP   2m21s
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          20m
```

---
## With configuration 

I created config files and applied them

Below you will see the commands applied and output
of `kubectl get pods,svc`
![result](pics/img_2.png)

and `minikube service --all`

![result2](pics/img_3.png)

