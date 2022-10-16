# Report

## Description

The logging stack consists of Promtail, Loki, Grafana.

The logs are collected from all containers.

## Proof that it works

1. Only python application

    ![Python app logs](images/python_only.png)

2. Go + Python application

    1. Available containers:

        ![Available containers to look at](images/container_selection.png)

    2. Go application logs:

        ![Go application logs](images/app_go.png)

    3. Python application logs:

        ![Python application logs](images/app_python.png)
