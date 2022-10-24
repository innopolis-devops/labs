# Monitoring: metrics

First, I reorganized all files in `monitoring` directory as in the [https://github.com/black-rosary/loki-nginx](example repository).

```bash
   monitoring
   ├── LOGGING.md
   ├── docker-compose.yaml
   ├── grafana
   │   └── provisioning
   │       └── datasources
   │           └── loki.yaml
   ├── images
   │   ├── 1.png
   │   ├── 2.png
   │   └── 3.png
   └── promtail
       └── promtail.yaml
```

Then I added Prometheus related parts to the `docker-compose.yaml` file and `prometheus` directory.

I followed same tutorial:

- [prometheus/prometheus.yaml](https://github.com/black-rosary/loki-nginx/blob/master/prometheus/prometheus.yml)
- [docker-compose.yaml](https://github.com/black-rosary/loki-nginx/blob/master/docker-compose.yml)

I also installed `prometheus-flask-exporter` and followed [this tutorial](https://blog.viktoradam.net/2020/05/11/prometheus-flask-exporter/).

I pushed a new image with changes and run `docker-compose up`.

To see the targets I followed `http://localhost:9090/targets` and got:
![targets](images/4.png)

Dashboards in Grafana for Loki and Prometeheus:

![loki](images/loki.png)
![prometheus](images/prometheus.png)
