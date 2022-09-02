# app_python

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

### Run black

#### Check formatting

    black --check . --verbose --diff

#### Automatically fix formatting (done in pre-commit)

    black .

### Run flake8

    flake8 --verbose --max-line-length=80 --ignore="E203,W503"

### Run isort

#### Check unsorted imports

    isort . --diff --quiet --check-only

#### Automatically sort imports (done in pre-commit)

    isort .

### Run mypy

    mypy .
