Grafana Monitoring
=======

## Setup
### Prerequisite
* grafana
* promtail (provides logs for loki)
* loki (talks with grafana)

### Steps taken
1. Create config folder
with grafana, loki and promtail folders. On each folder we will have
configuration files. `mkdir config/grafana config/loki config/promtail`
2. Create other folder for volumes (grafana-data, loki-data and promtail-data) `mkdir grafana-data loki-data promtail-data`
3. Add configuration files to related folders (`loki.yml`, `loki-config.yml`, `promtail.yml`)
4. Then run `docker compose up`
5. Grafana needs time to be available. Check first `http://localhost:3100/metrics`. If
everything is okay you should see logs, access `http://localhost:3100/ready`. If ready
status is shown you can access `http://localhost:3000` which is grafana.
6. In grafana login page enter admin:admin and change password.
7. Next, go to "add new data source", select loki, specify url (it should be
`http://<your_ip>:3100/`), test, and explore logs.

## query and logs
![](https://github.com/Amirka-Kh/devops-labs/blob/lab7/monitoring/img.png)
![](https://github.com/Amirka-Kh/devops-labs/blob/lab7/monitoring/img_1.png)