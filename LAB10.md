# 10

## Helm

In this lab you need to get familiar with `Helm`. Setup local development environment and prepare a few manifests for your application.

### 10 points

1. Read about `Helm`:
    * [Helm Architecture](https://helm.sh/docs/topics/architecture/)
    * [Charts](https://helm.sh/docs/topics/charts/)

2. Install helm:
    * [Installing Helm](https://helm.sh/docs/intro/install/)
    * [Chart repository](https://helm.sh/docs/intro/quickstart/#initialize-a-helm-chart-repository)

3. Create your own chart:
    * [Example](https://helm.sh/docs/intro/using_helm/#creating-your-own-charts)
    * Inside the `k8s` folder use `helm create your-app` to create a template.
    * To use your own application repository instead of the default repository provided, replace the default repository and tag inside the `values.yaml` with your repository name.
    * Don't forget to change `containerPort` in the `deployment.yml`.
    * If you can't troubleshoot `livenessProbe` and `readinessProbe` - comment it.

    > Use `minikube dashboard` command for troubleshooting.

4. Install your helm chart and make sure that all services are healthy. Check `Workloads` page in the `minikube` dashboard.

5. Check it with the `minikube service your_service_name` command. Also provide the output of the `kubectl get pods,svc` command in the report.

6. Create a PR to the forked repo lab9 branch, ask your teammates to review it and review PRs of your teammates.

7. Create a PR in your own repository from the lab10 branch to the lab9 one. It will help us with grading.

### List of requirements

* Helm Chart
* Output of `kubectl get pods,svc` command in `README.md` in `k8s` folder

## Bonus

### 1 point

1. Prepare a helm chart for your extra app.
2. Read about `Library Charts` and `Umbrella charts`, provide the explanation in a nutshell, as you understand it. No copy paste.
