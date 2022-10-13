# Metrics report

## 6 points

Prometheus is up and running. It collects metrics (incl. from endpoints added in previous labs) from containers that are specified in config (namely, python/rust apps, itself, loki, promtail).

`/targets` in prometheus:

![all targets present](report_artifacts/prometheus_targets.png)

example of metric graph

![flask total requests graph](report_artifacts/prometheus_graph.png)

## 4 points + Bonus

### Dashboards

Rocket
![dashboard 1](report_artifacts/graphana_dashboard_rocket.png)

Flask
![dashboard 2](report_artifacts/graphana_dashboard_flask.png)

Loki
![dashboard 3](report_artifacts/graphana_dashboard_loki.png)

Prometheus
![dashboard 4](report_artifacts/graphana_dashboard_prometheus.png)

### Healthchecks

![healthy containers](report_artifacts/docker_healthy.png)
