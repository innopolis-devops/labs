## Overview ![App Rust CI](https://github.com/AKurmazov/labs/actions/workflows/app_rust.yml/badge.svg)
A simple Rust/Rocket app that shows current time. The timezone is *Europe/Moscow*

## Build

Make sure that you have docker installed. Run the following command to build the image

```bash
$ docker build -f Dockerfile -t akurmazov/app_rust-server:latest .
```

Additionally, you can push it to the registry

```bash
$ docker push akurmazov/app_rust-server:latest
```

You will not be able to push in my registry, but you can try it out with yours

> Note: If you are planning to run the app locally, just give it time... It takes a bit long to start

## Running the image
To run the image, use the following command

```bash
$ docker run -p 8000:8000 akurmazov/app_rust-server:latest cargo run
```

Here we have three main args passed to the `docker run` command

* `-p 8000:8000` defines the port mapping between the container and the local machine
* `akurmazov/app_rust-server:latest` states what image is intended to be used
* `cargo run` specifies the command to be executed within the container

## Running via docker-compose
You can startup the server by running the following command

```bash
$ docker-compose up
```

Now, you can access the server at http://127.0.0.1:8000

Note that the timezone is configured within the code. The default offset is 3 hours (i.e., *Europe/Moscow*).
If you want to change the timezone, simply change it in the `utils.rs` file, and build the project.

## Docker

All the changes related to Docker are documented within this file above

## Linting

#### Code
Additionally, you can run linters over the project code with the aid of the following commands

Via `docker-compose run`
```bash
$ docker-compose run server make lint
```

Via `docker run`
```bash
$ docker run akurmazov/app_rust-server:latest make lint
```

#### Markdown
I used the built-in PyCharm Markdown linter

#### Dockerfile
I used the `hadolint/hadolint` linter (more on it in **DOCKER.md**)

You can run it via `hadolint Dockerfile` being in the `app_rust` directory (assuming it is installed)


## Testing
Furthermore, you can run unit tests, and check the coverage of the project

Via `docker-compose run`
```bash
$ docker-compose run server make test
```

Via `docker run`
```bash
$ docker run akurmazov/app_rust-server:latest make test
```

## GitHub Actions CI

The GitHub Actions configuration used in this project has three jobs: Snyk, Build, and Publish

* Snyk — checks the Docker image for vulnerabilities
* Build — installs the dependencies, lints and tests the code
* Publish — builds an image and tags it :latest, pushes the image to the docker hub

The workflow is triggered only on changes in the ./app_rust directory or in the workflow configuration itself

## Persistence

Whenever somebody accesses the index route `/`, a counter increments. You can check the current counter value at `/visits` route

## Contacts

* Telegram: @AKurmazov
* Email: a.kurmazov@innopolis.university
