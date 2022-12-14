# 14

## K8s

### 10 points

In this lab you will figure out how to operate k8s cluster monitoring with Prometheus. And then you will get
familiar with `Init Containers`.

1. Read about `Kube Prometheus Stack`:
    * [Helm chart with installation guide](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
    * [Explanation of components](https://github.com/prometheus-operator/kube-prometheus#kubeprometheus)

2. Create `14.md` file and describe there all components of the stack and their purpose. Don't copy paste, just the role and how you understand it.

3. Install the helm chart to your k8s cluster. Also, install your app's helm chart. Provide the output of the
`kubectl get po,sts,svc,pvc,cm` command in the report. Also explain what the command means.

4. Use the `minikube service monitoring-grafana` command to access Grafana. Click on the `Search dashboard` button to see all already prepared for you dashboards. Use existing dashboards to find the information about your cluster:
    1. Check how much CPU and Memory your StatefulSet is consuming.
    2. Check which Pod is using CPU more than others and which is less in the default namespace.
    3. Check how much memory is used on your node, in % and mb.
    4. Check how many pods and containers actually ran by the Kubelet service.
    5. Check which Pod is using network more than others and which is less in the default namespace.
    6. Check how many alerts you have. Also you can see them in the Web UI by the `minikube service monitoring-kube-prometheus-alertmanager` command.
    7. Provide all answers in the report.

5. Read about `Init containers`:
    * [Concept](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/)
    * [Tutorial](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-initialization/#create-a-pod-that-has-an-init-container)

6. Let's use an Init container to download any file, like in the tutorial:
    1. Create a new Volume.
    2. Create Init container.
    3. Use `wget` to download any file (You can use a site from the example).
    4. Provide a proof of your success, for example `kubectl exec pod/demo-0 -- cat /test.html`

7. Create a PR to the forked repo lab14 branch, ask your teammates to review it and review PRs of your teammates.

8. Create a PR in your own repository from the lab14 branch to the lab13 one. It will help us with grading.

### List of requirements

* Explanation of monitoring stack components.
* Provide answer of `kubectl get po,sts,svc,pvc,cm` in the report and explain what does it do
* Answer all 6 question in point 4 in `14.md`
* Implement `Init container`
* Provide proofs that your `init Container` downloads a file.

## Bonus

### 2 points

1. Get metrics from your app. Provide a proof
2. Create a queue of three Init containers, with any logic like adding new lines to the same file. Provide a proof with the cat tool.
