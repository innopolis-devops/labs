# Logging

## Description

For logging `Promtail`, `Loki` and `Grafana` were used. Configuration for `Promatail`
is in `promtail.yml` file. To start the stack, run

`sudo docker-compose up`

After it web interface is available on `127.0.0.1:3000`. Logs from both `app_python`
and `app_php` can be gotten in appropriate tabs.

## Screenshot

![app_python](/monitor/screenshots/1.png)

![app_php](/monitor/screenshots/2.png)
