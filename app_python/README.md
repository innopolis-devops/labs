# Python Time Web App

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

---

An app that allows to receive the current time in Moscow by a web request. Makes sure the time is correct by synchronizing it to the Google's NTP server at the startup.

## Installation

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
