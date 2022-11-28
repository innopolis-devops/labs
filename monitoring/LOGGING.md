# Lab 7. Logging report

## Main task

After `docker-compose up`, promtail will read logs from docker containers, push it to loki. Grafana will ask loki for new logs, and we will able see following logs:

![grafana_example_1](https://i.imgur.com/CUuw0bV.png)

Interesting thing is that loki doesn't need and configuration file, since promtail pushes logs to it and grafana pulls logs from it, so I added config files only for loki and grafana :)

## Bonus task

Also added my rust application to docker-compose. Now I can see it logs in grafana:

![grafana_example_2](https://i.imgur.com/C1vqq7q.png)
