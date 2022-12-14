# 11

## K8s secrets and resources

### 10 points

In this lab you will figure out how to manage sensitive data such as a password, a token, or a key in kubernetes. Then you will set up CPU and memory limits for your app.

1. Create a secret in your cluster using `kubctl`.

    * [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
    * [Managing secrets](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/#decoding-secret)

2. Verify and decode your secret, then create 11.md in the k8s folder and provide the output of the commands inside.

3. So we'll skip configuration file for secret, let's use helm.

    * You need to create `secrets.yaml` file in `templates` folder.
    * Create a `secret` object inside.
    * Add `env` field to your `Deployment`. Path that you will need: `spec.template.spec.containers.env.`

        > [Helm secrets](https://www.youtube.com/watch?v=hRSlKRvYe1A)

    * Update your helm deployment (instructions are present in the video). Get pods: `kubectl get po.` Use the name of the pod to provide a proof of your success. Check your secret inside pod, example: `kubectl exec demo- 5f898f5f4c-2gpnd -- printenv | grep MY_PASS.`

4. Read about Resources management:

    * [Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

5. Set up requests and limits for CPU and memory for your application and test that it works.

6. Create a PR to the forked repo lab11 branch, ask your teammates to review it and review PRs of your teammates.

7. Create a PR in your own repository from the lab11 branch to the lab10 one. It will help us with grading.

### List of requirements

* proof of work with a secret in 11.md for the step 2
* secrets.yaml
* proof of work with  a secret in 11.md for the step 3
* resource requests and limits for cpu and memory

## Bonus

### 2 points

1. Add environment variables for your containers:

   * Read about it:

       * [K8s env vars](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

   * Update your helm chart with several environment variables, but use named templates, move them to `_helpers.tpl` file:
       * [Helm named templates](https://helm.sh/docs/chart_template_guide/named_templates/)
