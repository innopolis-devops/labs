# 12

## K8s ConfigMaps

In this lab you will figure out how to manage non-confidential data in kubernetes.

### 10 points

1. Read about `ConfigMaps` objects:
    * [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)

2. We tried env vars, so let's mount a config file to our container. Create a folder `files` with `config.json`
file inside. Put some data in json format inside to check your success in the end.

3. Use helm and mount config.json:

    * Create a `configMap` manifest. Get data from your `config.json`, use `.Files.Get`.
    * Then update your `deployment.yaml`. Add `Volumes` and `VolumeMounts`.
    > [Example](https://carlos.mendible.com/2019/02/10/kubernetes-mount-file-pod-with-configmap/)
    * Install your updated helm chart and test the result. Get pods: `kubectl get po`. Use the name of the pod to provide a proof of your success. Check your config map inside pod, example: - `kubectl exec demo-758cc4d7c4-cxnrn -- cat /config.json`.`.Files.Get`.

4. Create 12.md in the k8s folder and provide the output of the commands inside.

5. You need to upgrade your application. For future labs your app must do something persistent. You can follow next steps or suggest any your logic.

    1. Your application must write to a file the time when the root path `/` was accessed by the client.
    2. It must have a new endpoint with path `/visits`.
    3. Return the content via new endpoint, like you saw it for `/metrics`, but in any format.
    4. Test it:
        1. Update your `docker-compose.yml`.
        2. Add a new volume for your file.
        3. Test that it works.
        4. Update your README.md for your application.

6. Create a PR to the forked repo lab12 branch, ask your teammates to review it and review PRs of your teammates.

7. Create a PR in your own repository from the lab12 branch to the lab11 one. It will help us with grading.

### List of requirements

* `config.json` file in `files` folder
* `configMap` that takes data from `config.json` using `.Files.Get`
* `volume`s and `volumeMount`s exist in deployments.yml
* `12.md` file with results of commands

## Bonus

### 2 points

1. Upgrade your bonus app in the same way, it must do something persistent.
2. Read about `StatefulSet, Headless service, Persistent Volumes`. Describe how did you understand them, and why do we need them.
    * <https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/>
    * <https://kubernetes.io/docs/concepts/services-networking/service/#headless-services>
    * <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>
