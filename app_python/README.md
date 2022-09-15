# Python Time Web App

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

---

All the installation is just to setup the required Python packages:

```sh
pip install -r requirements.txt
```

## Usage

### Gunicorn

App is configured to run with [Gunicorn](https://github.com/benoitc/gunicorn), which allows it to use all CPU cores and run incredibly fast.

Use the following commmand to start the app:

```sh
gunicorn --config .\gunicorn.conf.py app:app
```

### Uvicorn

Gunicorn runs only on UNIX systems. For Windows, you may use Uvicorn directly:

```sh
uvicorn app:app
```

For testing purposes, you may also want to add `--reload` flag the the command above.

## See also

Check out [PYTHON.md](./PYTHON.md) for implementation details.

See [DOCKER.md](./DOCKER.md) for details on the Docker configuration.
