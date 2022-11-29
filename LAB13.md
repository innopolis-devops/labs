# 13

## K8s StatefulSet

### 10 points

In this lab you will figure out how to manage stateful applications with provided guarantees about the ordering and uniqueness of a set of Pods.

1. Read about `StatefulSet` objects:
    * [Concept](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
    * [Tutorial](https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/)

2. Update your helm chart. Prepare a manifest for `StatefulSet`:

    * Rename your deployment.yml to statefulset.yml.
    * Follow the tutorial and update your manifest.
    * Test it with command: `helm install --dry-run --debug name_of_your_chart path_to_your_chart`.
    * Fix all problems and deploy it.
    * Try to follow best practices and move some values to variables in `values.yml` meaningfully.

3. Check and provide proof Wof your success:

    * Create a `13.md` report.
    * Put an output of `kubectl get po,sts,svc,pvc` command to the `13.md` report.
    * Use `minikube service name_of_your_statefulset` command to access you app.
    * Use several tabs in your browser, incognito mode, etc to access the root path of your app.
    * Check the content of your file, in each pod, example - `kubectl exec pod/demo-0 -- cat visits` provide the output of the command for all replicas.
    * Describe and explain in the report the differences between the output of the command for replicas.

4. For our app ordering guarantee are unnecessary. Describe in the report why. Then find a way to tell to
the StatefulSet controller to launch or terminate all Pods in parallel. Implement it.

5. Create a PR to the forked repo lab13 branch, ask your teammates to review it and review PRs of your teammates.

6. Create a PR in your own repository from the lab13 branch to the lab12 one. It will help us with grading.

### List of requirements

* Outputs of commands in `13.md`.
* Results of number of visits command for each pod, and explanation of results in `13.md`.
* Answer questions from point 4 in `13.md`.
* Implementation of parallel launch and terminate.

## Bonus

### 2 points

1. Follow the main steps for your extra app
2. Read about update strategies. Describe how did you understand them, kinds and difference.
