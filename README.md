Innopolis DevOps labs
===

Here you can find devops labs project. It is simple web application that returns current moscow time

# Build & run

1. Native run for development
```bash
$ cd app_python
$ python -m pip install poetry
$ python -m poetry install
$ python -m poetry shell
$ flask run --host=0.0.0.0 --port=4444
```

2. Production run in docker

```bash
$ docker run -p 4444:4444 --rm lymarenkolev/currenttime
```

or build locally

```
$ cd app_python
$ docker build . -t currenttime
$ docker run --rm -p 4444:4444 currenttime
```

# Linter

assume that poetry and packages already installed

```
$ black .
```

# Usage

```bash
$ curl localhost:4444
```

