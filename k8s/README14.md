## Lab 14
```
mikado@Alyssas-MacBook-Pro k8s % kubectl get po,sts,svc,pvc,cm
NAME                                                         READY   STATUS              RESTARTS      AGE
pod/alertmanager-devops-time-app-kube-prome-alertmanager-0   0/2     ContainerCreating   0             28s
pod/devops-time-app-c955c4545-tjsrr                          1/1     Running             1 (17d ago)   21d
pod/devops-time-app-c955c4545-tjsrr-5c9746d475-qlllr         1/1     Running             1 (17d ago)   18d
pod/devops-time-app-grafana-767f9fd848-srwf7                 0/3     ContainerCreating   0             62s
pod/devops-time-app-kube-prome-operator-5cb4859f4c-lrtgh     1/1     Running             0             62s
pod/devops-time-app-kube-state-metrics-6c8b89c764-chcbv      1/1     Running             0             62s
pod/devops-time-app-prometheus-node-exporter-dfstx           1/1     Running             0             62s
pod/prometheus-devops-time-app-kube-prome-prometheus-0       0/2     Init:0/1            0             27s

NAME                                                                    READY   AGE
statefulset.apps/alertmanager-devops-time-app-kube-prome-alertmanager   0/1     28s
statefulset.apps/prometheus-devops-time-app-kube-prome-prometheus       0/1     27s

NAME                                               TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                      ClusterIP      None             <none>        9093/TCP,9094/TCP,9094/UDP   28s
service/devops-time-app                            LoadBalancer   10.102.64.14     <pending>     8000:32707/TCP               18d
service/devops-time-app-grafana                    ClusterIP      10.109.50.124    <none>        80/TCP                       62s
service/devops-time-app-kube-prome-alertmanager    ClusterIP      10.106.134.4     <none>        9093/TCP                     62s
service/devops-time-app-kube-prome-operator        ClusterIP      10.106.218.229   <none>        443/TCP                      62s
service/devops-time-app-kube-prome-prometheus      ClusterIP      10.99.86.163     <none>        9090/TCP                     62s
service/devops-time-app-kube-state-metrics         ClusterIP      10.103.205.87    <none>        8080/TCP                     62s
service/devops-time-app-prometheus-node-exporter   ClusterIP      10.108.3.184     <none>        9100/TCP                     62s
service/kubernetes                                 ClusterIP      10.96.0.1        <none>        443/TCP                      25d
service/prometheus-operated                        ClusterIP      None             <none>        9090/TCP                     27s

NAME                                                                     DATA   AGE
configmap/devops-time-app-grafana                                        1      62s
configmap/devops-time-app-grafana-config-dashboards                      1      62s
configmap/devops-time-app-kube-prome-alertmanager-overview               1      62s
configmap/devops-time-app-kube-prome-apiserver                           1      62s
configmap/devops-time-app-kube-prome-cluster-total                       1      62s
configmap/devops-time-app-kube-prome-controller-manager                  1      62s
configmap/devops-time-app-kube-prome-etcd                                1      62s
configmap/devops-time-app-kube-prome-grafana-datasource                  1      62s
configmap/devops-time-app-kube-prome-grafana-overview                    1      62s
configmap/devops-time-app-kube-prome-k8s-coredns                         1      62s
configmap/devops-time-app-kube-prome-k8s-resources-cluster               1      62s
configmap/devops-time-app-kube-prome-k8s-resources-namespace             1      62s
configmap/devops-time-app-kube-prome-k8s-resources-node                  1      62s
configmap/devops-time-app-kube-prome-k8s-resources-pod                   1      62s
configmap/devops-time-app-kube-prome-k8s-resources-workload              1      62s
configmap/devops-time-app-kube-prome-k8s-resources-workloads-namespace   1      62s
configmap/devops-time-app-kube-prome-kubelet                             1      62s
configmap/devops-time-app-kube-prome-namespace-by-pod                    1      62s
configmap/devops-time-app-kube-prome-namespace-by-workload               1      62s
configmap/devops-time-app-kube-prome-node-cluster-rsrc-use               1      62s
configmap/devops-time-app-kube-prome-node-rsrc-use                       1      62s
configmap/devops-time-app-kube-prome-nodes                               1      62s
configmap/devops-time-app-kube-prome-nodes-darwin                        1      62s
configmap/devops-time-app-kube-prome-persistentvolumesusage              1      62s
configmap/devops-time-app-kube-prome-pod-total                           1      62s
configmap/devops-time-app-kube-prome-prometheus                          1      62s
configmap/devops-time-app-kube-prome-proxy                               1      62s
configmap/devops-time-app-kube-prome-scheduler                           1      62s
configmap/devops-time-app-kube-prome-workload-total                      1      62s
configmap/kube-root-ca.crt                                               1      25d
configmap/prometheus-devops-time-app-kube-prome-prometheus-rulefiles-0   29     28s
```
This command shows status of pods, stateful sets, services, persistent volume claims and configmaps.

## Components
Prometheus Operator - Set of tools for K8s deployment, prometheus management and monitoring
Prometheus - Monitoring system & time series database. It stores metrics in time series database.
Alertmanager - sort alerts and send messages.
Prometheus node-exporter - a tool used in K8s as exporter for machine metrics.
Prometheus Adapter for Kubernetes Metrics APIs - adapter for monitor K8s resource metrics
kube-state-metrics - Expose cluster-level metrics for Kubernetes objects.
Grafana - a free software data visualization system focused on data from IT monitoring systems.
 
## Grafana
Unfortunately, it didn't work on my computer
Some proofs:
```
mikado@Alyssas-MacBook-Pro k8s % minikube service devops-time-app-grafana                

❌  Exiting due to SVC_TIMEOUT: Check that minikube is running and that you have specified the correct namespace: service 'devops-time-app-grafana' could not be found running: Get "https://172.16.244.6:8443/api/v1/namespaces/default/services/devops-time-app-grafana": http2: client connection lost

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│                                                                                                                          │
│    😿  If the above advice does not help, please let us know:                                                            │
│    👉  https://github.com/kubernetes/minikube/issues/new/choose                                                          │
│                                                                                                                          │
│    Please run `minikube logs --file=logs.txt` and attach logs.txt to the GitHub issue.                                   │
│    Please also attach the following file to the GitHub issue:                                                            │
│    - /var/folders/_m/dwdw5_5x72dcjgry7_nj3bh00000gn/T/minikube_service_ced31bfb168f423cc3d969530274e3b19bde7c38_0.log    │
│                                                                                                                          │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
Also 
```
mikado@Alyssas-MacBook-Pro k8s % minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

mikado@Alyssas-MacBook-Pro k8s % minikube service monitoring-grafana                                    
🤷  This control plane is not running! (state=Stopped)
❗  This is unusual - you may want to investigate using "minikube logs"
👉  To start a cluster, run: "minikube start"
mikado@Alyssas-MacBook-Pro k8s % minikube status                    
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Stopped
kubeconfig: Configured
```
Я понятия не имею, почему minikube service monitoring-grafana крашит apiserver. Он через некоторое время опять воскресает, но это все равно не спасает ситуацию.
 Например:
 ```
 mikado@Alyssas-MacBook-Pro k8s % minikube stop                                           
✋  Stopping node "minikube"  ...
🛑  1 node stopped.
mikado@Alyssas-MacBook-Pro k8s % minikube start                                          
😄  minikube v1.28.0 on Darwin 11.6.1
✨  Using the vmware driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🔄  Restarting existing vmware VM for "minikube" ...
🐳  Preparing Kubernetes v1.25.3 on Docker 20.10.20 ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
mikado@Alyssas-MacBook-Pro k8s % minikube service devops-time-app-grafana
|-----------|-------------------------|-------------|--------------|
| NAMESPACE |          NAME           | TARGET PORT |     URL      |
|-----------|-------------------------|-------------|--------------|
| default   | devops-time-app-grafana |             | No node port |
|-----------|-------------------------|-------------|--------------|
😿  service default/devops-time-app-grafana has no node port
mikado@Alyssas-MacBook-Pro k8s % helm show values prometheus-community/kube-prometheus-stack | grep  adminPassword
  adminPassword: prom-operator
mikado@Alyssas-MacBook-Pro k8s % minikube service devops-time-app-grafana                                         
🤷  This control plane is not running! (state=Stopped)
❗  This is unusual - you may want to investigate using "minikube logs"
👉  To start a cluster, run: "minikube start"
mikado@Alyssas-MacBook-Pro k8s % minikube status                                                                  
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

mikado@Alyssas-MacBook-Pro k8s % minikube service devops-time-app-grafana
🤷  This control plane is not running! (state=Stopped)
❗  This is unusual - you may want to investigate using "minikube logs"
👉  To start a cluster, run: "minikube start"
mikado@Alyssas-MacBook-Pro k8s % minikube status                         
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Stopped
kubeconfig: Configured
 ```
 Спасибо за курс, но нам с компом очень больно






