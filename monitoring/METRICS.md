# Metrics

Mostly I followd this [guide](https://grafana.com/docs/grafana-cloud/quickstart/docker-compose-linux/). It helped add and configure prometheus.

There is one service down. It happened because, at it is stated in the report of Prometheus, there is no `localhost:5000/metrics` which means that my web app does not have such a route, that is why it doesn't respond.

![](/monitoring/screenshots/Prometheus1.png)
![](/monitoring/screenshots/Prometheus2.png)