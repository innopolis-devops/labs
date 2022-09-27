# 7

## Monitoring: logging

In this lab you need to get familiar with a logging stack - Promtail, Loki, Grafana. Then prepare a docker-compose ﬁle and conﬁg ﬁles to setup the stack.

### 10 points

1. Read about the logging stack:

   * https://grafana.com/go/webinar/loki-getting-started/
   * https://grafana.com/docs/loki/latest/overview/

2. Prepare a docker-compose ﬁle with the stack and your app.

   * [examples of docker-compose](https://github.com/grafana/loki)
   * [example of promtail conﬁguration](https://github.com/black-rosary/loki-nginx), but be smart

3. Test that it works, prepare a `LOGGING.md` report.
4. Create a monitoring folder, put report, docker-compose.yml and conﬁg ﬁles inside.
5. Provide screenshots of your success in the report.
6. Create a PR to the forked repo lab7 branch, ask your teammates to review it and review PRs of your teammates.
7. Create a PR in your own repository from the lab7 branch to the lab6 one. It will help us with grading.

## Bonus

### 2 points

1. Add your extra app to the `docker-compose.yml`.
2. Conﬁgure stack to get logs from all containers from docker-compose.yml. Provide
screenshots of your success in the report.
