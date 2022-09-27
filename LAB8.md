# 8

## Monitoring: metrics

In this lab you need to get familiar with Prometheus. Then you need to set up it and configure apps to obtain metrics.

### 6 points

1. Read about Prometheus
   * https://prometheus.io/docs/introduction/overview/
   * https://prometheus.io/docs/practices/naming/
2. Add Prometheus to the `docker-compose.yml` file from the previous lab.
3. Configure Prometheus to obtain metrics from Loki and Prometheus containers.
4. Check `http://localhost:9090/targets`.
   * Provide screenshots of your success in `METRICS.md` in monitoring folder.
5. Create a PR to the forked repo lab8 branch, ask your teammates to review it and review PRs of your teammates.
6. Create a PR in your own repository from the lab8 branch to the lab7 one. It will help us with grading.

### 4 points

1. Set up dashboards in Grafana for Loki and Prometeheus. Examples:
   * https://grafana.com/grafana/dashboards/13407
   * https://grafana.com/grafana/dashboards/3662
   * Provide screenshots of your success in `METRICS.md`
2. Update conﬁg of all services in `docker-compose.yml`.
   * Add log rotation.
   * Add mem limits.
3. Gather metrics from all services in the `docker-compose.yml` file.

## Bonus

1. Add any metrics to your apps. Python examples:
   * https://dzone.com/articles/monitoring-your-synchronous-python-web-application
   * https://opensource.com/article/18/4/metrics-monitoring-and-python
2. Obtain metrics from your apps.
3. Update the `METRICS.md` with screenshots.
4. Update conﬁg of all services in `docker-compose.yml` - add healthchecks.
