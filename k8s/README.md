# K8S

## Manual deployment

- Create a Deployment of `app_python` application

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111867-0abd6de4-2861-4d72-94b7-9a65d3afd337.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112568-2f5beb09-b320-4b1d-9853-e302d9027072.png"/>
</p>

- Create a Service of `app_python` application

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111968-ff04c297-8ce8-44cb-82e6-c730a0fab135.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199111987-891a21c2-9f64-492d-ad09-aff35a870506.png"/>
</p>

- The output of `kubectl get pods,svc`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112009-92e43fc8-8bca-4588-9468-cadee6aec88d.png"/>
</p>

## Declarative Management of Kubernetes Objects Using Configuration Files

- Create a Deployment of `app_python` application and run `minikube service --all`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112045-7cd48622-df08-456f-9078-76791c4764ca.png"/>
</p>

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112093-2d32f4ad-ba5d-4d4b-b04b-35dc8e7a78f2.png"/>
</p>

- Create a Deployment of `app_kotlin` application and run `minikube service --all`

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112165-45d29f3c-c906-4def-b857-a99fbdc5bebd.png"/>
</p>

- `app_python` has port **59065** and `app_kotlin` has port **59063**

<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/199112201-4376134b-8586-4d50-a8bf-689b858e5cbf.png"/>
</p>

## Theory

- **Ingress** - An object which can provide name-based virtual hosting,
  SSL termination and load balancing via managing external access
  to the services in a cluster.

- **Ingress controller** - A controller which is required to run **Ingress**.
  It maintains the **Ingress** resource.

- **StatefulSet** - An object which deploys pods of stateful applications
  and assigns unique identifiers.

- **DaemonSet** - checks that every node runs a copy of a pod for running
  cluster storage, logs collection or node monitoring daemon.

- **PersistentVolumes** - is a resource which provides an API of abstracts
  details about the storage.

Ref: [https://kubernetes.io/docs/concepts](https://kubernetes.io/docs/concepts)
