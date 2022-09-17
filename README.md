# Innopolis DevOps labs

![app_python](https://github.com/sevenzing/devops/actions/workflows/python.yml/badge.svg)
![app_rust](https://github.com/sevenzing/devops/actions/workflows/rust.yml/badge.svg)

Here you can find devops labs project. It is simple web application that returns current moscow time

## Build & run

1. Native run for development

```bash
cd app_python
python -m pip install poetry
python -m poetry install
python -m poetry shell
flask run --host=0.0.0.0 --port=4444
```

2. Production run in docker

```bash
docker run -p 4444:4444 --rm lymarenkolev/currenttime
```

or build locally

```bash
cd app_python
docker build . -t currenttime
docker run --rm -p 4444:4444 currenttime
```

3. Using docker-compose

```bash
docker-compose up
```

## Linter

assume that poetry and packages already installed

```bash
black .
```

## Unit tests

### python

```bash
cd app_python
pytest .
```

### rust

```bash
cd app_rust
cargo test
```

## Usage

```bash
$ curl localhost:4444
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Innopolis DevOps</title>
</head>
<body>
    <center><p>Hello from Python app!</p></center>
    <center><p>MSK time: 13:56:33</p></center>
</body>
</html>
```
