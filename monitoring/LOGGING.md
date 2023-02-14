# Logging

I followed [tutorial](https://grafana.com/docs/loki/latest/installation/docker/), which I found in Loki's GitHub [repo](https://github.com/grafana/loki). There I found several files (docker-compose, loki-config and promtail-config which are needed as config files in compose) and slightly modified compose file.

In order to check, run `docker-compose -f docker-compose.yml` in this directory.

However, I couldn't successfully complete part with Grafana. For some reson, Promtail wouldn't connect.

Sometimes it considered the config file to be a directory after mounting. Sometimes it just wouldn't transfer the log. Or, maybe, then the problem was with Loki.

I tried using `sudo` access, putting config to different folders, different compose file options, different promtail configs. The best I could do is to have logs in my web console matching regex from promtail and having some redundant info about PC boot in Loki as a label.

![](/monitoring/screenshots/1.png)
![](/monitoring/screenshots/2.png)
![](/monitoring/screenshots/3.png)
![](/monitoring/screenshots/4.png)
