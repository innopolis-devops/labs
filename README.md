# Innopolis DevOps course fall 2022

![python workflow](https://github.com/chermnyx/devops/actions/workflows/python.yml/badge.svg?branch=lab3)
![rust workflow](https://github.com/chermnyx/devops/actions/workflows/rust.yml/badge.svg?branch=lab3)
![pre-commit](https://github.com/chermnyx/devops/actions/workflows/pre-commit.yml/badge.svg?branch=lab3)

## Overview

The repository consists of 2 apps: python app and rust app

## Python app

### Build and Run

### Unit tests

Run ``

#### Build with Podman (or Docker)

Image: <https://hub.docker.com/repository/docker/chermnyx/inno-devops-python>

1. Build or Pull

   1. Build

      ```bash
      podman build . -t docker.io/chermnyx/inno-devops-python
      ```

   2. Pull

      ```bash
      podman pull docker.io/chermnyx/inno-devops-python
      ```

2. Run

   ```bash
   podman run -p 8080:8080 docker.io/chermnyx/inno-devops-python
   ```

#### Run locally without containers

1. Install dependencies

   ```bash
   poetry install
   ```

2. Test it

   ```bash
   poetry run python -m pytest
   ```

3. Run

   ```bash
   poetry run uvicorn app:app --port 8080
   ```

### Usage

Navigate to our app and see current time in ISO format

## Rust app

### Build and Run

### Unit tests

Run `poetry run python -m pytest`

#### Build with Podman Podman (or Docker)

Image: <https://hub.docker.com/repository/docker/chermnyx/inno-devops-rust>

1. Build or Pull

   1. Build

      ```bash
      podman build . -t docker.io/chermnyx/inno-devops-rust
      ```

   2. Pull

      ```bash
      podman pull docker.io/chermnyx/inno-devops-rust
      ```

2. Run

   ```bash
   podman run -p 8080:8080 docker.io/chermnyx/inno-devops-rust
   ```

#### Run locally without containers

1. Build the app

   ```bash
   cargo build
   ```

2. Test it

   ```bash
   cargo test
   ```

3. Run

   ```bash
   cargo run
   ```

### Usage

Navigate to our app and see current time in ISO format

## Contact

Dmitrii Chermnykh <d.chermnykh@innopolis.university>
