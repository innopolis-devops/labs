# Grafana

### starting

1) watch [video](https://youtu.be/qE6hEHNH9dE) and follow the steps described
2) run docker-compose pull
3) run docker-compose up
4) http://localhost:3000
5) create new data source with url http://loki:3100
6) receive a problem `Data source connected, but no labels received. Verify that Loki and Promtail is configured properly.`
7) look at logs
8) seems like my promtail container haven't started running
9) look at `docker-compose.ym`l and `promtail.yml`
10) try to google and change files. nothing worked
11) ask my friend for help.
12) 3 hours of sequential debugging
### results of debugging
1) changed paths in volumes `docker-compose.yml` file
2) changed file path in command section
3) use a lot of commands to understand what's the problem
4) try to fix it last time with `echo -e "[automount]\noptions = \"metadata\"\n" | sudo tee /etc/wsl.conf` and `cat /etc/wsl.conf`
5) it did't work.
6) ok, just dgaf

btw logs are fine, maybe it's a problem in me or WSL. maybe I should redo configuration files, but tbh I don't care for now, i'm too tired to do smth with it