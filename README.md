# Moscow Timezone

[![Python App](https://github.com/sokratmillman/labs/actions/workflows/app_python.yml/badge.svg)](https://github.com/sokratmillman/labs/actions/workflows/app_python.yml)

## Name

Maxim Stepanov

## Description

This project is a Python app that shows current time in Moscow timezone.

For every reload, it updates the time.

## GitHub

### Installation

In order to run the project, one will need `python` of version 3 and higher, `pip`

Then, git clone the repo, checkout to lab1. Go to app_python directory.

Create new virtual environment:

```bash
python3 -m venv env
```

Activate virtual ENV:

```bash
source env/bin/activate
```

Install necessary modules:

```bash
pip install -r requirements.txt
```

### Usage

Run the application:

```bash
flask run
```

By default, it will run on localhost:5000.

This behavior can be changed with `port` and `host` command-line options.

Then, in browser go to `127.0.0.1:5000` or any other custom configuration {HOST}:{PORT}

## Docker

There is another way of running the application which requires [Docker](https://docs.docker.com/get-docker/) installed.

Once you have it installed, run:

```
docker pull sokratmillman/flask_app
```

The command above will pull an image from Docker Hub. Run a container from it:

```
docker run -p 5000:5000 sokratmillman/flask_app
```

On MacOS, there might occur a problem with 5000-th port.

If that's a case, replace `5000:5000` with `xxxx:5000` where `xxxx` is any unused port.

Then, the application will run on `127.0.0.1:5000` or `127.0.0.1:xxxx` if the MacOS-port-error was thrown.

## Unit tests

I wrote only one unit test for now using `pytest` for now.

More information is placed in `app_python/PYTHON.md`.


## Metric

Time of visits can be retrieved on `localhost:5000/visits` after the app is run.

## Contact

University mail: ma.stepanov@innopolis.university

Telegram: @sokratmillman

GitHub: sokratmillman
