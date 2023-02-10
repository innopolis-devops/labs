## Start

1) download kubectl and minikube

2) start minicube `minicube start`

3) create deployment `kubectl create deployment mosc-time --image=geralizz/moscow_time:latest`

4) create service `kubectl expose deployment mosc-time --type=LoadBalancer --port=8000`

5) run `kubectl get pods,svc` (screenshot)


![](https://imageup.ru/img245/4205696/9-laba.png.html)

6) delete service and deployment `kubectl delete services mosc-time`, `kubectl delete deployment mosc-time`

![](https://imageup.ru/img297/4205699/laba2.png.html)

## Automatization

1) create `deployment.yaml` and `service.yaml` files

2) apply changes `kubectl apply -f deployment.yml`, `kubectl apply -f service.yml`

3) run `kubectl get pods,svc`

![](https://imageup.ru/img123/4205705/9laba3.jpg)

4) run `minikube service --all`

![](https://imageup.ru/img116/4205709/9laba4.png.html)

 