## Introduction

In this lab, I set up a logging stack using Promtail, Loki, and Grafana. I also prepared a docker-compose.yml file to set up the stack and my application.

## Setting Up the Files

To set up the files for the logging stack, I followed these steps:

1. Created a Dockerfile for my application in the app_python directory.
2. Created a docker-compose.yml file in the root directory of my project.
3. Created a promtail directory in the root directory of my project.
4. Created a config.yaml file inside the promtail directory.
5. Created a monitoring directory in the root directory of my project.
6. Created a LOGGING.md file inside the monitoring directory.

## Docker Compose File

Here's the docker-compose.yml file I used to set up the logging stack and my application:
    version: '3'
services:
  app:
    build: ../app_python
    ports:
      - "5000:5000"
  loki:
    image: grafana/loki:latest
    ports:
      - "3100:3100"
  promtail:
    image: grafana/promtail:latest
    volumes:
      - ./promtail:/etc/promtail
    command: -config.file=/etc/promtail/config.yaml
  grafana:
    image: grafana/grafana:latest
    ports:
      - "3000:3000"

This file sets up four services: my application, Loki, Promtail, and Grafana.

## Promtail Configuration

Here's the config.yaml file I used to configure Promtail:

This configuration sets up Promtail to listen on port 9080 and to push logs to Loki.

## Testing

To test the logging stack, I ran the following command in the terminal:

This command started all the services defined in the docker-compose.yml file. I then navigated to http://localhost:5000 in my web browser to test my application. I also navigated to http://localhost:3000 to check the logs in Grafana.

## Screenshots

Here are some screenshots of my success:

- ![Screenshot of my application running](/graffana.png)


## Conclusion

In conclusion, I was able to successfully set up a logging stack using Promtail, Loki, and Grafana. I also prepared a docker-compose.yml file to set up the stack and my application. 
