## 'kubectl get pods,svc'

'''
PS E:\projects\temp\k8s> kubectl get pods,svc
NAME                                    READY   STATUS    RESTARTS   AGE
pod/app-python-manual-68b44895b-nmwkw   1/1     Running   0          4m47s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python-manual   LoadBalancer   10.106.205.86   <pending>     8080:30022/TCP   2m52s
service/kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP          35m
'''

## 'kubectl get pods,svc' config files

'''
PS E:\projects\temp\k8s> kubectl get pods,svc
NAME                                         READY   STATUS    RESTARTS   AGE
pod/app-python-deployment-6984c6c867-2t28h   1/1     Running   0          17s
pod/app-python-deployment-6984c6c867-9ktz8   1/1     Running   0          17s
pod/app-python-deployment-6984c6c867-cj22d   1/1     Running   0          17s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/kubernetes          ClusterIP      10.96.0.1       <none>        443/TCP          39m
service/my-service          LoadBalancer   10.110.68.191   <pending>     8080:32204/TCP   8s
'''

## minikube service --all'

'''
PS E:\projects\temp\k8s> minikube service --all
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | app-python |        5000 | http://192.168.49.2:31097 |
|-----------|------------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
* service default/kubernetes has no node port
* Starting tunnel for service app-python.
* Starting tunnel for service kubernetes.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | app-python |             | http://127.0.0.1:51279 |
| default   | kubernetes |             | http://127.0.0.1:51281 |
|-----------|------------|-------------|------------------------|
* Opening service default/app-python in default browser...
* Opening service default/kubernetes in default browser...
! Because you are using a Docker driver on windows, the terminal needs to be open to run it.
'''

## Screenshot

![app](/k8s/screenshot.png?raw=true "app")