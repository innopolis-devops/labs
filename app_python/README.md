# Moscow time app

![app_python](https://github.com/ezio-42/devops-labs/actions/workflows/app_python.yaml/badge.svg)

## Overview

Web application that displays current time in Moscow.

## Usage

### Install dependencies

#### Only dependencies (for production run)

    poetry install --no-dev

#### Both dev tools and dependencies

    poetry install

### Run

    python3 main.py

## Development

### Install pre-commit hooks (run this after dev tools installation)

    pre-commit install

### black

#### Install black (in case of separate usage)

    pip install black

#### Check formatting

    black --check . --verbose --diff

#### Automatically fix formatting (done in pre-commit)

    black .

### flake8

#### Install flake8 (in case of separate usage)

    pip install flake8

#### Check formatting and errors (done in pre-commit)

Ignore some rules due to conflict with black.

    flake8 --verbose --max-line-length=80 --ignore="E203,W503"

### isort

#### Install isort (in case of separate usage)

    pip install isort

#### Check unsorted imports

    isort . --diff --quiet --check-only

#### Automatically sort imports (done in pre-commit)

    isort .

### mypy

#### Install mypy (in case of separate usage)

    pip install mypy

#### Check type errors (done in pre-commit)

    mypy .

### Run markdownlint (done in pre-commit)

    pre-commit run -a markdownlint-fix

### Run hadolint (done in pre-commit)

    pre-commit run -a hadolint-docker

### Unit tests

#### Run tests

    pytest . -v

## Docker

### Build image locally

    docker build -t grommash99/moscow-time-py:latest -f Dockerfile .

### Pull from Docker Hub

    docker pull grommash99/moscow-time-py

### Run container with application

    docker run -d --rm -p "8080:8080" --name moscow-time-py grommash99/moscow-time-py

## Metrics

Metrics are available at `http://localhost:8080/metrics`.
