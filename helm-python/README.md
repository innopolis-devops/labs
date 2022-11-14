# Helm

NAME                              READY   STATUS    RESTARTS        AGE
pod/app-python-7959c56f55-ftpj4   1/1     Running   0               2m28s
pod/apppython-66f4c9df47-9lrbh    1/1     Running   2 (4m53s ago)   7d1h
pod/apppython-66f4c9df47-9npk4    1/1     Running   2 (4m53s ago)   7d1h
pod/apppython-66f4c9df47-cbg48    1/1     Running   2 (4m53s ago)   7d1h

NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/app-python      ClusterIP   10.106.225.92   <none>        80/TCP    2m28s
service/kubernetes      ClusterIP   10.96.0.1       <none>        443/TCP   7d1h
service/pythonservice   ClusterIP   10.111.0.100    <none>        80/TCP    7d1h