# Metrics report

## Results

Prometheus is up and running. It collects metrics (incl. from endpoints added in previous labs) from containers that are specified in config (namely, python/rust apps, itself, loki, promtail).

`/targets` in prometheus:

![all targets present](report_artifacts/prometheus_targets.png)

example of metric graph

![flask total requests graph](report_artifacts/prometheus_graph.png)
