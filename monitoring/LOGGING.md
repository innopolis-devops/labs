# Monitoring: logging

In this lab I used logging stack - Promtail, Loki, Grafana.

1. First, I installed a `docker-compose.yaml` file [with Docker Compose](https://grafana.com/docs/loki/latest/installation/docker/), added app related part and prepared config files to setup the stack.

1. To start the it, I ran the command:

    ```bash
        docker-compose up
    ```

1. Navigated a browser to `http://localhost:3000`.

1. Clicked on the Grafana instance’s Explore icon.

1. Chose the Loki datasource.

1. Tried queries:

    ![first](images/1.png)
    ![second](images/2.png)

1. And clicked on the blue Run query button to see all the log lines generated:

    ![third](images/3.png)
