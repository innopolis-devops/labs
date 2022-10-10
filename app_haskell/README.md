# Moscow time app

![app_haskell](https://github.com/ezio-42/devops-labs/actions/workflows/app_haskell.yaml/badge.svg)

## Overview

Web application that displays current time in Moscow.

## Usage

### Build

    make build

After build binaries will be placed to `target` directory.

### Run

You can either run binary file generated after build or simply run

    make run

## Development

For the development you will need to use `stack`
([link](https://docs.haskellstack.org/en/stable/README/)).

### Install pre-commit hooks

    pip install pre-commit
    stack install hlint stylish-haskell
    pre-commit install

### Interactive shell

    stack repl

### Run stylish-haskell

#### Check formatting

    stylish-haskell src -r
    stylish-haskell app -r
    stylish-haskell test -r

#### Automatically fix formatting  (done in pre-commit)

    stylish-haskell src -r --inplace
    stylish-haskell app -r --inplace
    stylish-haskell test -r --inplace

### Run hlint (done in pre-commit)

    hlint .

### Run markdownlint (done in pre-commit)

    pre-commit run -a markdownlint-fix

### Run hadolint (done in pre-commit)

    pre-commit run -a hadolint-docker

### Unit tests

#### Run tests

    make test

## Docker

### Build image locally

    docker build -t grommash99/moscow-time-hs:latest -f Dockerfile .

### Pull from Docker Hub

    docker pull grommash99/moscow-time-hs

### Run container with application

    docker run -d --rm -p "8080:8080" --name moscow-time-hs grommash99/moscow-time-hs

## CI

### stylish-haskell

You can quickly download the latest binary `stylish-haskell` like so:

    ../scripts/scripts/download-stylish-haskell.sh

### hlint

You can quickly download the latest binary `hlint` like so:

    ../scripts/download-hlint.sh

## Metrics

Metrics are available at `http://localhost:8081/`.
