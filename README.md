# Moscow time zone web application

[![Lint markdown files](https://github.com/bragov4ik/devops/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/bragov4ik/devops/actions/workflows/markdown-lint.yml) [![Python package](https://github.com/bragov4ik/devops/actions/workflows/python-build.yml/badge.svg)](https://github.com/bragov4ik/devops/actions/workflows/python-build.yml)

This application launches a web server that runs on port 8000 and responds with current time in UTC/GMT +3 timezone.

## Python implementation

You can find implementation written in Python language in folder `app_python`. Also there is `PYTHON.md` file in the directory that lists some best practices used in the project and reasoning behind framework choice.

This application can be set up/run manually or as a docker container

### Docker run guide

#### With `docker compose`

If you have docker compose installed, you can just write `docker compose up` inside project folder.

#### Without `docker compose`

Without `compose` you can use `docker run -p 8000:8000 --rm bragov4ik/time_web_app:latest`.
*Note that building the image by yourself requires docker buildkit enabled*

### Manual run

#### Preparation (set up)

* Open project folder
* Create virtual environment with `python3 -m venv venv`
* Activate the venv with `. venv/bin/activate`
* Install requirements with `pip3 install -r requirements.txt`

#### Run

Start the server with `gunicorn app:app -b 0.0.0.0:8000`

### Unit tests

To test you first need to install requirements for test environment `pip3 install -r requirements/test.txt`

With `pytest` and other requirements installed you simply need to type `pytest` inside python project folder.

### Docker hub integration

To publish a new version to docker hub create a tag corresponding to the (semver) version of expected image. For example `v1.2.3`.

When the tag appears in the repo, workflow will build the image and push it to docker hub.

Note that the tag must belong to some branch in GitHub otherwise the job will fail.

## Rust 🦀 memory-safe 🛡️ blazing fast 🚀 implementation

Rust implementation together with corresponding `RUST.md` is located in `app_rust` folder.

This application can be set up/run manually or as a docker container.

### Configuration

You can update webserver configuration in `Rocket.toml` file. Documentation on the config can be found [here](https://rocket.rs/v0.5-rc/guide/configuration/).

### Docker run guide

#### With `docker compose`

If you have docker compose installed, you can just write `docker compose up` inside project folder.

#### Without `docker compose`

Without `compose` you can use `docker run -p 8000:8000 --rm bragov4ik/time_rust_web_app:latest`.
*Note that building the image by yourself requires docker buildkit enabled*

### Manual run

To run use `cargo run`

## Usage

When any of the servers is up and running, you can open [localhost:8000](localhost:8000) and you should see current Moscow time.
