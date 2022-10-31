# K8s

### Manual deployment

```bash
kubectl create deployment app-python --image=markovvn1/iu-devops:lab_python
kubectl expose deployment add-python --type=LoadBalancer --port=80
kubectl get (deployments/services)
minikube service app-python
```

Output of the `kubectl get pods,svc` command after manual deployment:

![](.github/img1.png)

Deployed website:

![](.github/img2.png)

### Deployment with Configuration Files

```bash
kubectl apply -f <config_file>.yml
```

Output of the `kubectl get pods,svc` command after deployment:

![](.github/img3.png)

Deployed website:

![](.github/img4.png)

![](.github/img5.png)