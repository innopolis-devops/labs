# Logging

## Running locally

If you want to set up the environment and test my solution, simply run the following command

```bash
$ docker-compose up
```

Then, visit Grafana at _http://0.0.0.0:3000/_ and see the logs

## Grafana

I created a dashboard and added a panel for each of the services: **app_python**, **app_rust**, **grafana**, **promtail**, and **loki**

Below you can see the logs for all the services at once

![](https://i.imgur.com/obIcuBJ.png)
![](https://i.imgur.com/xGLpfY4.png)
