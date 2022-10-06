# Python Time Web App

[![Testing CI status](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-python.yml/badge.svg)](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-python.yml)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

---

An app that allows to receive the current time in Moscow by a web request. Makes sure the time is correct by synchronizing it to the Google's NTP server at the startup.

## Features

- App shows the current time in Moscow at `/` route
- App counts successfully served requests
- App has a status route `/status`, which displays the served requests count as well.
- Routes accept only `GET` requests, giving out proper errors (404/405) on incorrect requests.

## Docker image

### Docker Compose — preffered method

New app versions require Redis database for storing metrics and will not work without Redis connection.
It is highly recommended to use Docker Compose to run the app:

```sh
docker compose up -d
```

Anyway, here are the instructions in case you want to run the app separately, assuming you have a running Redis server.

### From Docker Hub

The app has a [docker image](https://hub.docker.com/r/ntdesmond/iu-devops-python) in Docker Hub.

To fetch it, use `docker pull ntdesmond/iu-devops-python` command.

Note that this docker image is built with `REDIS_HOST` set to `redis` and `REDIS_PORT` is `6379`, as per [`.env`](./.env) file.

### Building locally

Run `docker build -t ntdesmond/iu-devops-python .` in the current directory to build the app locally.

You may want to edit [`.env`](./.env) file first.

### Start the app

Here is a sample command to run the image:

```sh
docker run --rm -p 8000:8000 ntdesmond/iu-devops-python
```

You may want to change the port binding (`-p` option). Within the container, the app uses `8000` port.

## Local installation

### Requirements

- Python 3 (tested at 3.10)

### Dependencies for running the app

All the installation is just to setup the required Python packages:

```sh
pip install -r requirements.txt
```

### Development dependencies

If you wish to install development packages as well (for code formatting and testing), use [`requirements-dev.txt`](./requirements-dev.txt) instead:

```sh
pip install -r requirements-dev.txt
```

## Usage

### Configuration

Edit [`.env`](./.env) file to suit your needs berfore running the app.

### Gunicorn

App is configured to run with [Gunicorn](https://github.com/benoitc/gunicorn), which allows it to use all CPU cores and run incredibly fast.

Use the following command to start the app:

```sh
gunicorn --config ./gunicorn.conf.py app.api:app
```

### Uvicorn

Gunicorn runs only on UNIX systems. For Windows, you may use Uvicorn directly:

```sh
uvicorn app.api:app
```

For testing purposes, you may also want to add `--reload` flag the the command above.

## Unit tests

To run tests, use either of these commands after installing [dev requirements](#development-dependencies):

### Run all the tests

This will show a verbose output only if a test fails.

```sh
pytest
```

### Run tests more verbosely

This will show the name of each test run and the output of the logger, if any.

```sh
pytest tests/
```

## See also

Check out [PYTHON.md](./PYTHON.md) for implementation details about Python and unit tests.
