# Metrics collection with Prometheus

## Table of contents

- [Prometheus config](#prometheus-config)
- [Results](#results)
- [Dashboards](#dashboards)
- [`docker-compose.yml` improvements](#docker-compose-improvements)
- [Metrics collection in apps](#metrics-collection-in-apps)
- [Healthcheck in Docker Compose](#healthcheck-in-docker-compose)

## Prometheus config

Idk honestly I just took things from [loki production example](https://github.com/grafana/loki/blob/main/production/docker/docker-compose.yaml) and tuned them to fit the existing structure.

I don't have 3 types of Loki containers and a gateway for them, so I just changed Prometheus config to scrape metrics from the only Loki container I have, plus the Prometheus container itself.

I've also added some persistency to Prometheus and Grafana by adding volumes in the docker-compose file and attaching them to the container.

## Results

### `/targets`

![/targets](https://i.imgur.com/3b4B4ea.png)

### Sample query

Query: `loki_log_messages_total`

![loki_log_messages_total](https://i.imgur.com/LbMu5ba.png)

## Dashboards

Installed the ones suggested in the lab task:

- Loki: <https://grafana.com/grafana/dashboards/13407>
- Prometheus: <https://grafana.com/grafana/dashboards/3662>

I've also added Grafana provisionong config to add these dashboards automatically at startup.

### Loki dashboard

![Loki dashboard](https://i.imgur.com/T7yWeq7.png)

### Prometheus dashboard

![Prometheus dashboard](https://i.imgur.com/FnVLue1.png)

## docker-compose improvements

- Added log rotation via options for the default JSON logger:

```yaml
max-size: 10m
max-file": 3
```

- Added memory limits for all the containers via `mem_limit` for each service.
  - Fun fact: `mem_limit` is said to be [not available in Compose V3](https://docs.docker.com/compose/compose-file/compose-file-v3/#resources), but it still seems to be working as of version 3.9:

  ```text
  CONTAINER ID   NAME                        CPU %     MEM USAGE / LIMIT   MEM %     NET I/O           BLOCK I/O   PIDS
  fbc700b3e62e   monitoring-ts_app-1         0.00%     33.99MiB / 100MiB   33.99%    4.18MB / 66.6kB   0B / 0B     22  
  3cba516cb78d   monitoring-python_app-1     2.25%     193.7MiB / 200MiB   96.85%    73.9kB / 46.3kB   0B / 0B     13  
  37c91ef734c0   monitoring-promtail-1       0.64%     28.43MiB / 100MiB   28.43%    1.27kB / 0B       0B / 0B     15  
  5fc9fa3b71b0   monitoring-redis_ts-1       0.19%     7.598MiB / 100MiB   7.60%     1.9kB / 608B      0B / 0B     5   
  57d21f6d7a7a   monitoring-loki-1           0.49%     49.91MiB / 100MiB   49.91%    102kB / 2.35MB    0B / 0B     13  
  24a9a5b48ea5   monitoring-grafana-1        0.08%     48.02MiB / 100MiB   48.02%    25.4kB / 8.22kB   0B / 0B     14  
  74af25fac8ab   monitoring-redis_python-1   0.15%     7.625MiB / 100MiB   7.62%     17.4kB / 8.1kB    0B / 0B     5   
  20cac6771b07   monitoring-prometheus-1     0.37%     55.52MiB / 100MiB   55.52%    2.35MB / 101kB    0B / 0B     13
  ```

- Added `python_app` and `ts_app` containers to `loki` network to enable metrics collection.

- Added [**healthchecks**](#healthcheck-in-docker-compose) using either `wget` or `redis-cli`

## Metrics collection in apps

For the Python app, I used [Prometheus FastAPI Instrumentator](https://github.com/trallnag/prometheus-fastapi-instrumentator) to collect metrics.

For Typescript (Express.js), [Express Prometheus bundle](https://github.com/jochen-schweizer/express-prom-bundle) is used.

Both instruments provide basic metrics about requests, including paths, response times, and status codes.

### Targets status

![Status](https://i.imgur.com/mlvuNlr.png)

### Graph of request count

Filtering by app type and route (`/`)

Query: `http_requests_total{handler="/",job="python_app"} or http_request_duration_seconds_count{path="/",job="ts_app"}`

![Graph](https://i.imgur.com/oS75cgC.png)

## Healthcheck in Docker Compose

### Implementation

Most containers have HTTP servers with a `/ready`, `/health` or, for my apps in Python and TypeScript, `/status`, so it makes sense to check health using these routes — which I did, mostly using `wget`.

Redis containers are checked using `redis-cli ping` command.

#### Promtail healthcheck with Bash

Unlike all others, Promtail container does not have `wget`, `curl` and even `nc`, but it has Bash, which [can do TCP stuff](https://www.linuxjournal.com/content/more-using-bashs-built-devtcp-file-tcpip).

I honestly admit that I took [the solution](https://github.com/innopolis-devops/labs/blob/c556e3520e813fb1b128b2346bf8f713b64ce7a8/monitoring/docker-compose.yml#L62) from @bragov4ik, but I have improved it in such a way that it displays the response body which contains a detailed message in case the container is not ready.

Here's is a brief explanation of the healthcheck command:

```bash
exec 3<>/dev/tcp/localhost/9080 && \        # Connect to tcp://localhost:9080 (Promtail HTTP)
echo -e 'GET /ready HTTP/1.0\n\n' >&3 && \  # Make a HTTP 1.0 request to /ready route
awk 'f;/^\r/{f=1}; $0 ~ /HTTP\/1.0 200/ {s=1}; END {exit !s}' <&3 || exit 1 # Parse the response using awk :ohh_yeah:
```

The `awk` program does 3 things:

1. Print all the lines after an empty line (that is, after all response headers)
2. If any of the lines (with headers) contains `HTTP/1.0 200`, set the success flag to 1
3. In the end, exit with 0 only if `HTTP/1.0 200` was found, 1 otherwise.

Why HTTP 1.0? Simply because it won't require adding `Host` and `Connection: close` headers.

### Ensuring the system health

```sh
docker ps
```

![docker ps output](https://i.imgur.com/78pzzx2.png)
