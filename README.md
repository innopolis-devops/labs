# Moscow time zone web application

This application launches a web server that runs on port 8000 and responds with current time in Moscow timezone.

## Python implementation

You can find implementation written in Python language in folder `app_python`. Also there is `PYTHON.md` file in the directory that lists some best practices used in the project and reasoning behind framework choice.

This application can be set up/run manually or as a docker container

### Docker run guide

If you have docker compose installed, you can just write `docker compose up`. Otherwise, do it as follows:

#### Build

To build docker image you need to

* Open project folder
* Run `docker build .`

#### Run

To run the image you can use `sudo docker run -p 8000:8000 --rm <image ID>`.

### Manual run

#### Preparation (set up)

* Open project folder
* Create virtual environment with `python3 -m venv venv`
* Activate the venv with `. venv/bin/activate`
* Install requirements with `pip3 install -r requirements.txt`

#### Run

Start the server with `gunicorn app:app -b 0.0.0.0:8000`

## Rust 🦀 memory-safe 🛡️ blazing fast 🚀 implementation

Rust implementation together with corresponding `RUST.md` is located in `app_rust` folder.

This application can be set up/run manually or as a docker container.

### Docker run guide

If you have docker compose installed, you can just write `docker compose up`. Otherwise, do it as follows:

#### Build

To build docker image you need to

* Open project folder
* Run `DOCKER_BUILDKIT=1 docker build .` (notice env variable, won't work without it)

#### Run

To run the image you can use `sudo docker run -p 8000:8000 --rm <image ID>`.

### Manual run

#### Configuration

You can update webserver configuration in `Rocket.toml` file. Documentation on the config can be found [here](https://rocket.rs/v0.5-rc/guide/configuration/).

#### Run

To run use `cargo run`

## Usage

When any of the servers is up and running, you can open [localhost:8000](localhost:8000) and you should see current Moscow time.
