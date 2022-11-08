# k8s

1. Install helm
```
sudo snap install helm --classic
```
2. Create chart
```
helm create app-python
```

3. 
```
NAME: app-python-1667874133
LAST DEPLOYED: Tue Nov  8 05:22:13 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace default svc -w app-python-1667874133'
  export SERVICE_IP=$(kubectl get svc --namespace default app-python-1667874133 --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo http://$SERVICE_IP:80
```

4. 
```
minikube dashboard
🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:37767/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
```

5.
```
minikube service app-python-1667874133
```

6.
```
kubectl get pods,svc
NAME                                         READY   STATUS             RESTARTS   AGE
pod/app-python-1667874133-6ff6cb5864-vv4vm   1/1     Running            0          15m

NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/app-python-1667874133   LoadBalancer   10.108.197.215   <pending>     80:30690/TCP     15m
service/app-python-service      LoadBalancer   10.98.90.62      <pending>     5000:30085/TCP   7d8h
service/kubernetes              ClusterIP      10.96.0.1        <none>        443/TCP          7d8h
```