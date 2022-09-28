# TTTime

[![Python app CI/CD](https://github.com/whutao/course-devops/actions/workflows/python.yml/badge.svg)](https://github.com/whutao/course-devops/actions/workflows/python.yml)

## About

Have you ever wondered "what time is currently in Moscow"?

The project TTTime is an UWA (useful web-application) - a
software that could help you to answer this question.
It displays the local Moscow time right in your browser!

## Installation

### Download the project

Clone the repo with the recent project version

```commandline
git clone https://github.com/whutao/labs.git
```

Go to the application folder

```commandline
cd labs/app_python
```

### Install python for Mac

Install home brew.

```commandline
$ /bin/bash -c "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Install python 3 if needed.

```commandline
brew install python3
```

### Setup the environment

Create a virtual environment.

```commandline
python3 -m venv venv
```

Select it

```commandline
source venv/bin/activate
```

Install requirements with pip.

```commandline
pip3 install -r requirements.txt
```

## Usage

### Python app

Use the single command to run the app

```commandline
gunicorn --bind 0.0.0.0:5050 tttime.app:app
```

You can check that everything works by visiting [`127.0.0.1:5050`](http://127.0.0.1:5050/).

### Swift app

The extra web application is written in swift and localted in *app_swift*.
It displays the current weekday name for you.

The solution is dockerized and hence you can run it using docker with

```commandline
cd app_swift
docker-compose build
docker-compose up
```

You can check that everything works by visiting [`127.0.0.1:5051`](http://127.0.0.1:5051/).

## Docker

### Run an app

Follow the steps

Open the project folder *app_LANGUAGE*

```commandline
cd app_LANGUAGE
```

Run

```commandline
docker compose up
```

To check that everything works correctly open a URL specified before.

### Run both

From the root folder, execute

```commandline
docker compose up
```

To check that everything works correctly open URLs specified before.

## Unit tests

The python application is covered with unit tests. After installation, one can run

```commandline
python3 -m pytest app_python/tests
```

to run the tests and see the coverage.

## Continuous Integration

The project is supported with the CI workflow (using GitHub)
that performs lint check, unit tests and upload
to dockerhub automatically.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Roman Nabiullin

- @whuthao (telegram)
- r.nabiullin@innopolis.university (university e-mail)
