# Sample Time App
> Shows current time in Moscow

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Setup](#setup)
* [Usage](#usage)


## General Information
- Simple Python server app that can be used to know current time in Moscow
- Show time at the moment of request
- Reload page to update time


## Technologies Used
- Python 3
- Flask framework for web application
- [pytz](https://pypi.org/project/pytz/) for timezone requests


## Setup
To run server you will need a `Python3` environment with `pip` installed.

Install a Flask framework and pytz library using:

```pip install flask pytz```


## Usage
To run the application, use the flask command:
```ps
flask --app app_python/main run
```

It will launch the server and show something like:
```ps
 * Serving Flask app 'app_python/main'
 * Debug mode: off
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
```
Server provides you with a local IP address to the server that can open in your browser and test the app.


## Docker
App can be placed into a Docker container. Use `docker build -t time-app app_python` to create a Docker image and `docker run -p 5000:5000 time-app` to run the image.

Also, an image can be found on Docker Hub [repo](https://hub.docker.com/r/tonydecva180xn/devops) with the `lab-2` tag. To run it locally use:
```ps
docker pull tonydecva180xn/devops
docker run -p 5000:5000 tonydecva180xn/devops:lab-2
```


## Unit tests
Unit test for time request present in `app_python/unittests.py` and can be run locally with:
```ps
python app_python/unittests.py
```


## GitHub Actions
Static analysis using `flake8`, testing using python `unittest` framework and publishing into Docker Hub is done automatically using GitHub Actions.

![badge](https://github.com/tonydecva180xn/devops-labs/actions/workflows/main.yaml/badge.svg)
