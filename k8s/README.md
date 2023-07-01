## kubectl get pods
NAME                     READY   STATUS    RESTARTS        AGE
moscow-6489c859b-v86nb   1/1     Running   1 (7m28s ago)   12m


## kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          128m
moscow       NodePort    10.106.170.135   <none>        8000:32134/TCP   5m28s

## kubectl get pods
NAME                      READY   STATUS    RESTARTS        AGE
moscow-78bccd8f65-b2s8h   1/1     Running   2 (3m7s ago)    3m36s
moscow-78bccd8f65-fskbx   1/1     Running   1 (3m18s ago)   3m36s
moscow-78bccd8f65-nlq6q   1/1     Running   1 (3m18s ago)   3m36s

## kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP    4m10s
moscow       ClusterIP   10.106.88.220   <none>        8081/TCP   99s

##  minikube service --all
W0701 11:43:34.451733 1771362 main.go:291] Unable to resolve the current Docker CLI context "default": context "default" does not exist
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|--------|-------------|---------------------------|
| NAMESPACE |  NAME  | TARGET PORT |            URL            |
|-----------|--------|-------------|---------------------------|
| default   | moscow |        8081 | http://192.168.49.2:30000 |
|-----------|--------|-------------|---------------------------|
🎉  Opening service default/moscow in default browser...

![Screenshot](./k8s/screen.png)