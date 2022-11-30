# Kubernetes

## CLI deployment

I deployed my image and inspected it via `minikube`.

```sh
minikube start
kubectl create deployment app-purescript-node --image deemp/app_purescript:latest
kubectl set env deployment/app-purescript-node PORT=8001 HOST=0.0.0.0
kubectl expose deployment app-purescript-node --type=LoadBalancer --port=8001
minikube service app-purescript-node
```

I go the following data.

The `minicube` readings after the deployment was completed:

![img](README/minikube1.png)

The corresponding screenshot from a browser:

![img](README/browser1.png)

The output of `kubectl get pods,svc`

![img](README/getPodsSvc1.png)

Finally, I deleted the deployment and the service

```sh
kubectl delete deployment app-purescript-node
kubectl delete service app-purescript-node
```

## Deployment from configs

I made config files in [app_python](./app_python) for `app_python` and started a cluster.

```sh
minikube start
kubectl apply -f app_python
minikube service --all
```

![img](README/minikube2.png)

Next, I checked that the service is available in a browser.

![img](README/browser2.png)

## Bonus

I adapted the configs for `app_purescript`, put them into [app_purescript](./app_purescript) and deployed.

![img](README/minikube3.png)

![img](README/browser3.png)

## References

- `port`, `targetPort`, `nodePort` - [src](https://www.bmc.com/blogs/kubernetes-port-targetport-nodeport/)
  - `Port` exposes the Kubernetes service on the specified port within the cluster. Other pods within the cluster can communicate with this server on the specified port.
  - `targetPort` is the port on which the service will send requests to, that your pod will be listening on. Your application in the container will need to be listening on this port also.
  - `NodePort` exposes a service externally to the cluster by means of the target nodes IP address and the NodePort. NodePort is the default setting if the port field is not specified.
