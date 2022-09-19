# Python Time Web App

[![Testing CI status](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-python.yml/badge.svg)](https://github.com/ntdesmond/iu-devops-labs/actions/workflows/test-python.yml)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

---

An app that allows to receive the current time in Moscow by a web request. Makes sure the time is correct by synchronizing it to the Google's NTP server at the startup.

## Docker image

### From Docker Hub

The app has a [docker image](https://hub.docker.com/r/ntdesmond/iu-devops-python) in Docker Hub.

To fetch it, use `docker pull ntdesmond/iu-devops-python` command.

### Building locally

Run `docker build -t ntdesmond/iu-devops-python .` in the current directory to build the app locally.

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

### Gunicorn

App is configured to run with [Gunicorn](https://github.com/benoitc/gunicorn), which allows it to use all CPU cores and run incredibly fast.

Use the following commmand to start the app:

```sh
gunicorn --config .\gunicorn.conf.py app.api:app
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

Check out [PYTHON.md](./PYTHON.md) for implementation details about Python, unit tests and Markdown.

See [DOCKER.md](./DOCKER.md) for details on the Docker configuration.
