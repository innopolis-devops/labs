# Promtail, Loki, Grafana #

## Docker compose ##

To get started with the logging stack, I created a docker-compose file that defines the services I want to run:

```
version: '2'

services:

  app_python:
    image: dapp7anyway/devops:latest
    restart: unless-stopped
    ports:
      - 40:4000
    logging:
      driver: "json-file"
      options:
        tag: "{{.ImageName}}|{{.Name}}"

  promtail:
    image: grafana/promtail:latest
    volumes:
      - ./promtail-config:/etc/promtail
    command: -config.file=/etc/promtail/promtail.yml
    ports:
      - "9080:9080"

  loki:
    image: grafana/loki:latest
    volumes:
      - ./loki-config:/etc/loki
    command: -config.file=/etc/loki/loki.yml
    ports:
      - "3100:3100"

  grafana:
    image: grafana/grafana:latest
    ports:
      - "3000:3000"
    environment:
      - GF_AUTH_ANONYMOUS_ENABLED=true
      - GF_AUTH_ANONYMOUS_ORG_ROLE=Admin
    volumes:
      - ./grafana-config:/etc/grafana
```

In this example, I define three services: Promtail, Loki, and Grafana. I map volumes for the configuration files and data directories, and expose ports for each service


## Configuration Files ##

Next, I created configuration files for Loki ```>>>```

```
auth_enabled: false

server:
  http_listen_port: 3100

ingester:
  lifecycler:
    address: 127.0.0.1
    ring:
      kvstore:
        store: inmemory
      replication_factor: 1
    final_sleep: 0s

schema_config:
  configs:
    - from: 2022-01-01
      store: boltdb-shipper
      object_store: filesystem
      schema: v11
      index:
        prefix: index_
        period: 168h

storage_config:
  boltdb_shipper:
```

and Promtail ```>>>```

```
server:
  http_listen_port: 9080

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: app
    static_configs:
      - targets:
          - web:8080
    labels:
      app: myapp
      env: prod
```

## Testing ##

Test the logging stack by running ```docker-compose up -d```

![01](https://github.com/dapp-anyway/devops/blob/lab7/monitoring/screenshots/01.png)

Сhecking if the container is working

![02](https://github.com/dapp-anyway/devops/blob/lab7/monitoring/screenshots/02.png)