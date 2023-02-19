# Monitoring: metrics #

Configuration file for Prometheus:

```
prometheus.yml
```

```
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: app_python
    static_configs:
      - targets:
        - localhost:5000

  - job_name: prometheus
    static_configs:
      - targets:
          - localhost:9090

  - job_name: promtail
    static_configs:
      - targets:
          - promtail:9080

  - job_name: loki
    static_configs:
      - targets:
          - loki:3100
```

![03](https://github.com/dapp-anyway/devops/blob/lab8/monitoring/screenshots/03.png)

![04](https://github.com/dapp-anyway/devops/blob/lab8/monitoring/screenshots/04.png)

![05](https://github.com/dapp-anyway/devops/blob/lab8/monitoring/screenshots/05.png)