## Overview ![App Python CI](https://github.com/AKurmazov/labs/actions/workflows/app_python.yml/badge.svg)
A simple FastAPI/Uvicorn app that shows current time. Default timezone is *Europe/Moscow*

## Build
First, configure the environment (via the `.env` file)

```bash
$ cp .env.example .env
```

Then, make sure that you have docker installed. Run the following command to build the project

```bash
$ docker build -f docker/server/Dockerfile -t akurmazov/server:latest .
```

Additionally, you can push it to the registry

```bash
$ docker push akurmazov/server:latest
```

Note that you will not be able to push in my registry, but you can try it out with yours

## Running the image
To run the image, use the following command

```bash
$ docker run -p 8000:8000 akurmazov/server:latest python -m poetry run uvicorn server.app:app --host 0.0.0.0
```

Here we have three main args passed to the `docker run` command

* `-p 8000:8000` defines the port mapping between the container and the local machine
* `akurmazov/server:latest` states what image is intended to be used
* `python -m poetry run uvicorn server.app:app --host 0.0.0.0` specifies the command to be executed within the container

If you want to change the timezone, simply pass an additional argument `--env TIMEZONE=<timezone>` (try *Europe/London*, *Europe/Berlin*)

## Running via docker-compose
You can startup the server by running the following command 

```bash
$ docker-compose up
```

Now, you can access the server at http://127.0.0.1:8000

If you want to change the timezone, simply change it in the `.env` file (try *Europe/London*, *Europe/Berlin*)

## Docker

All the changes related to Docker are documented within this file above

## Linting

#### Code
Additionally, you can run linters (flake8, isort, and mypy) over the project code with the aid of the following commands

Via `docker-compose run`
```bash
$ docker-compose run server make lint
```

Via `docker run`
```bash
$ docker run akurmazov/server:latest make lint
```
 
#### Markdown
I used the built-in PyCharm Markdown linter

#### Dockerfile
I used the `hadolint/hadolint` linter (more on it in **DOCKER.md**)

You can run it via `hadolint docker/server/Dockerfile` being in the `app_python` directory (assuming it is installed)

## Testing
Furthermore, you can run unit tests, and check the coverage of the project

Via `docker-compose run`
```bash
$ docker-compose run server make test
```

Via `docker run`
```bash
$ docker run akurmazov/server:latest make test
```

## GitHub Actions CI

The GitHub Actions configuration used in this project has three jobs: Snyk, Build, and Publish

* Snyk — checks the dependencies for vulnerabilities
* Build — installs the dependencies, lints and tests the code
* Publish — builds an image and tags it :latest, pushes the image to the docker hub

The workflow is triggered only on changes in the ./app_python directory or in the workflow configuration itself

## Persistence
Whenever somebody accesses the index route `/`, a counter increments. You can check the current counter value at `/visits` route

## Contacts

* Telegram: @AKurmazov
* Email: a.kurmazov@innopolis.university
