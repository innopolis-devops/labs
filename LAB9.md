# 9

## k8s

In this lab you need to get familiar with `Kubernetes`. Setup local development environment and prepare a
few manifests for your application.

### 10 points

1. Read about `Kubernetes`:
    * [K8s](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
    * [K8s components](https://kubernetes.io/docs/concepts/overview/components/)

2. Install `kubectl` and `minikube`:
    * [Tools](https://kubernetes.io/docs/tasks/tools/)

3. Deploy your application in the `minikube`. Use the `kubectl` create command to create a `Deployment`:
    * [Example](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-deployment)
    * [Overview](https://kubernetes.io/docs/tutorials/kubernetes-basics/deploy-app/deploy-intro/)

4. Make your application accessible from outside the `Kubernetes` virtual network. Create a `Service` for it:
    * [Example](https://kubernetes.io/docs/tutorials/hello-minikube/#create-a-service) -
    * [Overview](https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/)

5. Create a `k8s` folder in your repository and create a `README.md` report inside, provide the output of
`kubectl get pods,svc` command.

6. Clean up. Remove `deployment` and `service` that you created.

7. As you see it wasn't convenient way to manage your app. Use configuration files to deploy your application. Create a `deployment.yml` manifest for it. Set up at least 3 replicas:
    * [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
    * [Declarative Management of Kubernetes Objects Using Configuration Files](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)

8. Create a `service.yml` manifest for your app.
    * [Service](https://kubernetes.io/docs/concepts/services-networking/service/)

9. Provide those files in the `k8s` folder. Also provide the output of `kubectl get pods,svc` command in
the report. Provide output of `minikube service --all` command and result from your browser. The screenshot for the latter should show the same IP as in the `minikube service --all` output.

10. Create a PR to the forked repo lab8 branch, ask your teammates to review it and review PRs of your teammates.

11. Create a PR in your own repository from the lab9 branch to the lab8 one. It will help us with grading.

### List of requirements

* `deployment.yml`
* `service.yml`
* output of `kubectl get pods,svc` in README.md in the `k8s` folder
* output of `minikube service --all` in README.md in the `k8s` folder
* screenshot from a browser that shows the same ip as in the latter command.

## Bonus

### 2 points

1. Create `deployment` and `service` manifests for your extra app.

2. Read about `Ingress, Ingress controller, StatefulSet, DaemonSet, PersistentVolumes`, provide the explanation in a nutshell, as you understand it. No copy paste.
