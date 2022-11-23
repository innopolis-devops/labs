## Lab 12
`kubectl get po`
```
NAME                                               READY   STATUS    RESTARTS   AGE
devops-time-app-c955c4545-tjsrr                    1/1     Running   0          2d10h
devops-time-app-c955c4545-tjsrr-5c9746d475-qlllr   1/1     Running   0          26s
```
`kubectl exec devops-time-app-c955c4545-tjsrr-5c9746d475-qlllr   -- ls -l`
```
total 28
-rw-r--r-- 1 root root  615 Oct 17 19:55 DOCKER.md
-rw-r--r-- 1 root root  152 Oct 17 19:55 Dockerfile
-rw-r--r-- 1 root root  923 Oct 17 19:55 PYTHON.md
-rw-r--r-- 1 root root 2122 Oct 17 19:55 README.md
-rw-r--r-- 1 root root  469 Oct 17 19:55 app.py
-rw-r--r-- 1 root root  223 Oct 17 19:55 requirements.txt
drwxr-xr-x 2 root root 4096 Oct 17 19:55 tests
```
`kubectl exec devops-time-app-c955c4545-tjsrr-5c9746d475-qlllr -- cat config.json`
```
    {
    "version": "1.0.0",
    "history_text": "Moscow time"
}
```