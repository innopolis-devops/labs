# K8s - Lab 9

## Manually deploying Python app

* Output after running `kubectl get pods`:
![manually-pods.png](./images/manually-pods.png)
* Output after running `kubectl get svc`:
![manually-svc.png](./images/manually-svc.png)

## Deploying Python app with the use of configuration files

Configuration files for Python app are inside folder `/k8s/app-python`.

### Output after running `kubectl get pods`:
![app-python-configuration-files-pods.png](./images/app-python-configuration-files-pods.png)
### Output after running `kubectl get svc`:
![app-python-configuration-files-svc.png](./images/app-python-configuration-files-svc.png)
### Output after running `minikube service --all`:
![app-python-service-all.png](./images/app-python-service-all.png)
Screenshot from the browser:
![app-python-browser.png](./images/app-python-browser.png)

## Bonus task

## Deploying Java app with the use of configuration files

Configuration files for Java app are inside folder `/k8s/app-java`.

### Output after running `kubectl get pods`:
![app-java-configuration-files-pods.png](./images/app-java-configuration-files-pods.png)
### Output after running `kubectl get svc`:
![app-java-configuration-files-svc.png](./images/app-java-configuration-files-svc.png)
### Output after running `minikube service --all`:
![app-java-service-all.png](./images/app-java-service-all.png)
Screenshot from the browser:
![app-java-browser.png](./images/app-java-browser.png)

### Explanation of concepts

* Ingress - resource in K8s that contains set of rules to handle requests 
from outside world(for example, HTTP requests) to internal k8s services(for routing)
* Ingress Controller - controller(pod) that takes Ingress resource and sets up 
a reversed proxy(that listens all incoming traffic).
* StatefulSet - k8s object that manages pods(for example, scaling)
* DaemonSet - k8s object that guarantees that a copy of pod will be run on 
all or specific nodes
* PersistentVolumes - storage system resource(for example, physical SSD device) that
can be used pods as filesystem(persistent one). It's lifecycle does not dependent on 
the lifecycle of the pod.
