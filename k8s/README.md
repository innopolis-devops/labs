# Kubernetes

Create the deployment and expose it with the service with following commands:

```
kubectl create deployment timeweb --image=passkeyra/timeweb:latest
kubectl expose deployment timeweb --type=NodePort --port=50000
```

Get pods and services:

![](https://i.ibb.co/8g3SyCM/1.png)

Create the deployment and the service using yaml description:

![](https://i.ibb.co/sb0DcsY/2.png)

Look at the app by url http://192.168.49.2:31337/:

![](https://i.ibb.co/DpKV7fJ/3.png)
