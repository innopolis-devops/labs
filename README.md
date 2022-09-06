# Innopolis DevOps course fall 2022

## Overview

The repository consists of 2 apps: python app and rust app

## Python app

### Build and Run

#### Build with Podman (or Docker)

Image: <https://hub.docker.com/repository/docker/chermnyx/inno-devops-python>

1. Build

   ```bash
   podman build . -t chermnyx/inno-devops-python
   ```

2. Run

   ```bash
   podman run -p 8080:8080 chermnyx/inno-devops-python
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

#### Build with Podman Podman (or Docker)

Image: <https://hub.docker.com/repository/docker/chermnyx/inno-devops-rust>

1. Build

   ```bash
   podman build . -t chermnyx/inno-devops-rust
   ```

2. Run

   ```bash
   podman run -p 8080:8080 chermnyx/inno-devops-rust
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
