# GOVORIT MOSKVA

## Overview

This simple web appllication shows the current time in Moscow. Time is updated with each page refresh.
It is written in Python using Flask framework. The application can be run using docker-compose.

## Build

[Install Docker if you don't have it already.](https://docs.docker.com/get-docker/)

To build and run the application on arm64 systems, run the following command:

```bash
docker-compose up
```

On the amd64 systems use tag `amd64`.
For using the application on other architectures, build the image yourself using

```bash
docker build -t my-name .
```

Then change the image name in `docker-compose.yml` file.

## Usage

To use the application, open the following URL in your browser:

<http://localhost:1337>

## Docker

I have used Docker from the start in this project. The `docker-compose.yml` points to remote brebuilt image. Refer to Usage and Build sections for more details.

## Unit tests

If you do not have `unittest` module installed, install it using

```bash
pip install unittest
```

To run unit tests, run the following command:

```bash
python3 app_test.py
```

## CI

I am using GitHub Actions to run unit tests and build the image. The workflows are defined in `.github/workflows/` folder.

## Contact

You can message me using this link <https://glebosotov.t.me>
