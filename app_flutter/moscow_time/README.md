# moscow_time

## Overview

This simple web appllication shows the current time in Moscow. Time is updated live every second.
It is written in dart using Flutter framework. The application can be run using docker-compose.

## Build

[Install Docker if you don't have it already.](https://docs.docker.com/get-docker/)

To build and run the application on arm64 systems, run the following command:

```bash
docker-compose up
```

For using the application on other architectures, build the image yourself using

```bash
docker build -t my-name .
```

Then change the image name in `docker-compose.yml` file.

## Usage

To use the application, open the following URL in your browser:

<http://localhost:1338>

## Docker

I have used Docker from the start in this project. The `docker-compose.yml` points to remote brebuilt image. Refer to Usage and Build sections for more details.

## Contact

You can message me using this link <https://glebosotov.t.me>
