# Metrics

Configured Prometheus to obtain metrics from Loki and Prometheus containers:

![](.github/img3.png)

Set up dashboards in Grafana for Loki and Prometeheus:

![](.github/img6.png)

![](.github/img7.png)

Gather metrics from all services:

![](.github/img4.png)

Add mem limits for all services:

![](.github/img5.png)

## Bonus

Add any metrics to your apps (I have added the metric `http_requested_languages_total`):

![](.github/img8.png)

Update conﬁg of all services in `docker-compose.yml` - add healthchecks:

![](.github/img9.png)