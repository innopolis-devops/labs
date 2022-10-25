# Metrics lab (prometheus)

## HowToRun

```
docker-compose up -d
```

After starting of all containers you can check:
* graphana - http://localhost:3000
* promtail, loki - http://localhost:3100/ready
* go app - http://localhost:8080
* python app - http://localhost:5000
* prometheus - http://localhost:9090

## Configure Prometheus (6 points)

Checking http://localhost:9090/targets

![prometheus](assets/prometheus.jpg)

## Dashboards in Grafana (4 points)

Dashboards in Grafana for Loki and Prometeheus looks like:

Also, we added log rotation and mem limits in the docker-compose.yml file.

## Bonus task 

We added next metrics to python app:


We added healthchecks:
