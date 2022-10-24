# Metrics

## Prometheus metrics

### Targets

![targets](/monitor/screenshots/3.png)

### app_python metrics

![app_python metrics](/monitor/screenshots/4.png)

### app_php metrics

`calc` - the number of times the button `calculate` was clicked.

![app_php metrics](/monitor/screenshots/5.png)

## Grafana dashboards

### Loki

![loki_1](/monitor/screenshots/6.png)

![loki_2](/monitor/screenshots/7.png)

### Prometheus

![prometheus_1](/monitor/screenshots/8.png)

![prometheus_2](/monitor/screenshots/9.png)

## Healthcheck

Both applications has healthcheck pages.

* `app_python` - `/healthcheck`
* `app_php` - `/healthcheck.php`

They are checked not only for accessibility, but also if healthcheck
succeeded.

![healthcheck](/monitor/screenshots/10.png)
