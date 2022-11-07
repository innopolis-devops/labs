# Kubernetes - Lab 9

## Part 1 : Manual deployment

## 1.1 Steps

References: [Creating a deployment](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-deployment) , [Creating a service](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-service)

1. Install `kubectl` and `minikube`

2. Deployed the app in kubectl using `kubectl create deployment app-deployment --image=migorr/time-app-devops:latest`

3. Create a service and expose it on port 8080 `kubectl expose deployment app-deployment --type=LoadBalancer --port=8080`


## 1.2 Results

- `kubectl get deployments`

![](./images/deployments-manual.png)

- `kubectl get svc`

![](./images/services-manual.png)

- `minikube service --all`

![](./images/url-view-manual.png)

- Browser screenshoot

![](./images/browser-manual.png)


## Part 2 : Deployment with configuration files

## 2.1 Steps

1. To deploy pods, I used `kubectl apply -f deployment.yml`

2. To create a service from config, I used `kubectl apply -f service.yml`

## 2.2 Results

- `kubectl get pods`

![](./images/pods-config.png)

- `kubectl get svc`

![](./images/services-config.png)

- `minikube service --all`

![](./images/url-view-config.png)

- Browser screenshoot

![](./images/browser-config.png)


## Part 3 (Bonus): Definitions

1. <u><b>Ingress:</b></u>

    This is an API object that exposes HTTP and HTTPS routes from outside the cluster to services within the cluster, allowing external access to the cluster's services.

2. <u><b>Ingress controller</b></u>

    It allows to define how external clients are routed to a cluster's internal Services.

3. <u><b>StatefulSet</b></u>

    This is a controller in Kubernetes that manages the deployment and scaling of a set of Pods by assigning them a unique identity.

4. <u><b>DaemonSet</b></u>

    It is used to ensure that all nodes (or a specific subset of them) are running exactly one copy of a pod.

5. <u><b>PersistentVolumes</b></u>

    PV are used to provide persistent storage for the containerized applications. One of the most important functionalities of persistent volume is providing storage beyond the lifecycle of a pod.


# Helm - Lab 10

## 1.1 Steps

1. Created a template using `helm create my-app`
2. Updated `values.yaml` to use my own docker repository
3. Updated `deployment.yml` to use port `8080`
4. Installed helm chart using `helm install my-app . -f ./values.yaml`

## 1.2 Results

- `kubectl get pods`

![](./images/pods-helm.png)

- `kubectl get svc`

![](./images/service-helm.png)

- `minikube service my-app`

![](./images/minikube-services-helm.png)

- Browser screenshoot

![](./images/browser-helm.png)

## Part 3 (Bonus): Definitions

1. <u><b>Library Charts:</b></u>

    This is one type of Helm charts which contains chart definitions or primitives to be used by other helm charts. It was created to avoid/decrease chart definitions in templates which would be similar.

2. <u><b>Umbrella charts:</b></u>

    This is another type of chart that contains other sub-charts with the purpose of grouping them. This allows easy management and installtion of application's helm charts since each application might have it's helm chart.