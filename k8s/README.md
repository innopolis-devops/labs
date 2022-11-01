# K8s

### Manual deployment

```bash
kubectl create deployment app-python --image=markovvn1/iu-devops:lab_python
kubectl expose deployment add-python --type=LoadBalancer --port=80
kubectl get (deployments/services)
minikube service app-python
```

Output of the `kubectl get pods,svc` command after manual deployment:

![](.github/img1.png)

Deployed website:

![](.github/img2.png)

### Deployment with Configuration Files

```bash
kubectl apply -f <config_file>.yml
```

Output of the `kubectl get pods,svc` command after deployment:

![](.github/img3.png)

Deployed website:

![](.github/img4.png)

![](.github/img5.png)

### [Bonus] Deployment with Configuration Files of PHP app

Output of the `kubectl get pods,svc` command after deployment:

![](.github/img6.png)

Deployed website:

![](.github/img7.png)

![](.github/img8.png)

### [Bonus] K8S definitions

**Ingress** is a Kubernetes object that describes the set of rules for proxying traffic from an external source to services within the K8S cluster. Ingress object requires an ingress controller to route traffic.

The **Ingress controller** is usually a proxy service deployed in a cluster. Required to route the rules specified in the Ingress object.

**StatefulSet** is an API object used to manage and track stateful applications. StatefulSet manages the deployment and scaling of application pods. Helps to handle Pod shutdown events and implement Graceful Shutdown.

**DeamonSet** is a Kubernetes API object that ensures that a certain pod will run on all (or some) nodes.

**PersistentVolumes** is the unit of data storage where applications such as a database can store and work with their data. Several pods can use a single PersistentVolume.

