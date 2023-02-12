## kubernetes
1) install `kubectl`
2) install `minikube`
3) `minikube start`
4) create deployment and service by hand, run `kubectl get pods,svc`, delete deployment and service
![](https://imageup.ru/img115/4209276/9laba1.png)
5) create service and deployment from files, run `kubectl get pods,svc` and `minikube service --all`
![](https://imageup.ru/img94/4209282/9laba2.png)

## helm
1) install helm
2) helm create mostime
3) helm package mostime
4) helm install mostime ./mostime-0.1.0.tgz
5) run suggested commands
![](https://imageup.ru/img145/4209383/10laba1.png)
6) follow url 
![](https://imageup.ru/img173/4209389/10laba2.png)

ok, it's cool, it works somehow (forward probros)

**seems like some trouble has occured, remake the packageusing `moscow-time` name

7) oh sheesh i have readiness probe failed, in last lab we understood why, maybe here's same situation (minikube installed weird so there's no bridge for fine work of my soft. windows and my hands moment)

8) run needed commands
![imageup.ru](https://imageup.ru/img288/4209488/10-kf-f3.png)
