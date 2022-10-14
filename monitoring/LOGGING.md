# Logging with Loki

## Table of contents

- [Docker Compose](#docker-composeyml)
- [Promtail config](#promtail-config)
  - [Logs source](#mounting-the-logs-source)
  - [The config](#the-config-promtailyml)
- [Results](#results)
  - [Redis containers logs](#example-1-redis-running-containers)
  - [Python app logs](#example-2-python-app-logs)
  - [Log entries rates of all containers](#example-3-log-entries-rate-graphs)

## [`docker-compose.yml`](./docker-compose.yml)

The Compose file contains all the needed services to run the apps, plus the ones required for logging.

Services are grouped to networks. Here is the structure of the services:

- `python_app_network`
  - `python_app`
  - `redis_python`
- `ts_app_network`
  - `ts_app`
  - `redis_ts`
- `loki` (network)
  - `loki`
  - `promtail`
  - `grafana`

All the containers have a logger configured to add the tag attribute that identifies them:

```yaml
driver: json-file
  options:
    tag: "{{.ImageName}}|{{.Name}}"
```

This is needed because all logs are scrapped by `promtail` at the same time, and by default they do not include image and container name.

## Promtail config

### Mounting the logs source

It was quite hard to find the correct path to docker logs in Windows. While on Linux they are most probably residing in `/var/lib/docker/containers`, together with other stuff about the containers, in Windows (at least for me) the path appeared to me as follows:

```text
\\wsl$\docker-desktop-data\data\docker\containers
```

And it would probably be enough if I launched Docker Compose from Windows itself — I could just mount the path to `docker/` as is...

But I decided to use WSL. So I had to do [two more steps](https://github.com/microsoft/WSL/discussions/4176#discussioncomment-253018) to make the `docker/` folder accessible in the WSL:

1. In PowerShell/cmd, add the Network Drive:

   ```powershell
   net use l: \\wsl$\docker-desktop-data
   ```

   This could be also done via GUI in Windows Explorer, but this is not cool 👎

2. In WSL (I use Ubuntu btw):

   ```sh
   sudo mkdir /mnt/l
   sudo mount -t drvfs l: /mnt/l
   ```

   Ta-daa, now we have mounted a docker WSL drive into Ubuntu, which is also run in WSL.

After doing all that, I can simply bind the required folder to `promtail` as well as the config file:

```yaml
volumes:
  - /mnt/l/data/docker:/var/lib/docker:ro
  - ./promtail.yml:/etc/promtail/config.yml:ro
```

### The config ([promtail.yml](./promtail.yml))

#### `clients`

Since `promtail` and `loki` are in the same network, the url on `loki` hostname is passed as URL:

```yaml
clients:
  - url: http://loki:3100/loki/api/v1/push
```

#### `scrape_configs`

The docker directory is already mounted to the container, so I simply path the wildcard (glob) to all the logs available for Docker containers:

```yaml
scrape_configs:
  - job_name: docker-logs
    static_configs:
      - targets:
          - localhost
        labels:
          job: container-logs
          __path__: /var/lib/docker/containers/*/*.log
```

After that, there are some `pipeline_stages` ran to parse data from the received logs:

- image and container names from the `attrs.tag` field — these are also used to add labels to the log entries
- time (converted from RFC3339Nano format to timestamp in seconds and nanoseconds)
- stream (usually `stderr`)

## Results

As a result, after configuring Grafana to connect to `http://loki:3100`, all the Docker logs are available, labelled with iamge and container names.

### Example 1: `redis` running containers

Query:

```logql
{image_name="redis"} | json | line_format `{{.container_name}} {{.log}}`
```

![Redis query](https://i.imgur.com/wxzuc8g.png)

Result:

![Redis results](https://i.imgur.com/gqr9lqN.png)

### Example 2: Python app logs

Query:

```logql
{container_name="monitoring-python_app-1"} | json | line_format `{{.log}}`
```

![Python app query](https://i.imgur.com/UglRkVC.png)

Result:

![Python app results](https://i.imgur.com/WFcxgCf.png)

### Example 3: Log entries rate graphs

This example shows the amount of **log entries per second** for each container.

The time interval of ~15 seconds at startup is taken as an example.

Query:

```logql
sum by(container_name) (rate({job="container-logs"} | json [1s]))
```

![Graphs query](https://i.imgur.com/khFpci0.png)

Result:

![Graphs retrieved](https://i.imgur.com/n1kjDoV.png)
