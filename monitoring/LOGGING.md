## Grafana Monitoring

### Prerequisite
* grafana
* promtail (provides logs for loki)
* loki (talks with grafana)

### Steps to take
Create grafana folder (github did not add empty folder with commit)

Then run `docker-compose up` (I used also some settings)

Grafana is available at http://localhost:3000

`admin` is password and login

Go to settings and press data source, select loki

Specify next url for loki_url `http://loki:3100`

Press "Save & Test" button

![](https://github.com/Amirka-Kh/devops-labs/blob/lab7/monitoring/varlogs.jpg)