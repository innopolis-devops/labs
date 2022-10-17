# DevOps course at Innopolis University

> Semester 7, 4th study year

![Python CI workflow](https://github.com/SMore-Napi/DevOps_Innopolis/actions/workflows/python_ci.yml/badge.svg)
![Kotlin CI workflow](https://github.com/SMore-Napi/DevOps_Innopolis/actions/workflows/kotlin_ci.yml/badge.svg)

## Contents

- [Overview](#overview)
- [Build](#build)
- [Docker](#docker)
- [Usage](#usage)
- [Unit tests](#unit-tests)
- [Linters](#linters)
- [CI](#ci)
- [Contact](#contact)

## Overview

This is a simple web application that shows the Moscow time
each time when you refresh a page.
The application was developed in two programming languages:

- Python with the use of [FastAPI](https://fastapi.tiangolo.com) framework.
  Can be found in [app_python](/app_python/) folder.
- Kotlin with the use of [Spring](https://spring.io) framework.
  Can be found in [app_kotlin](/app_kotlin/) folder.

## Build

### Download

- Open your terminal
- `git clone https://github.com/SMore-Napi/DevOps_Innopolis.git`
- `cd DevOps_Innopolis`
- `git checkout lab7`

### Python build

#### Installation

- All required dependencies are stored in the `requirements.txt` file.
- Open your terminal.
- Go to the **app_python** folder: `cd app_python`
- `pip install -r requirements.txt`

#### Running

- Open your terminal
- Go to the **app_python** folder: `cd app_python/app`
- Run application: `uvicorn main:app --reload`

### Kotlin build

- Install [JDK](https://www.oracle.com/java/technologies/downloads/)
- Install [Gradle](https://gradle.org/install/)
- Open your terminal
- Go to the **app_kotlin** folder: `cd app_kotlin`
- Run application: `./gradlew bootRun`

## Docker

- You can skip the [Build](#build) part and avoid installing packages.
  Instead, run the docker image. Preliminarily, you should build or pull this image.

### Python image

#### Build Python image

- Open your terminal. Your directory should be the root: `pwd`: **/DevOps_Innopolis**
- Build image: `docker build -t app_python_image app_python`
   - `app_python_image` - image name. You can change it whatever you want.
   - `app_python` - the folder in which the `Dockerfile` is placed.
  > In case you are already in the **/app_python** folder, you can use
  this command `docker build -t app_python_image .`

#### Pull Python image

- In case you don't want to build an image, you can pull the already
  pushed image in the docker
  hub: [app_python](https://hub.docker.com/repository/docker/smorenapi/app_python)
- Run `docker pull smorenapi/app_python:latest`

##### Small instruction on how to push an image

- Assign image name: `docker image tag app_python_image:latest <login>/app_python:latest`
- Push: `docker image push <login>/app_python:latest`

> Use your docker hub login instead of `<login>`

#### Run Python image

- You need a built or pulled image.
- Run image: `docker run --rm -p 8000:8000 --name app_python <app_python_image>`
   - `--rm` automatically remove the container when it exits.
  You can omit this parameter.
   - `-p` expose port 8000.
   - `--name` - container name. You can specify any name you'd like.
   - `<app_python_image>` - image name.
      - Use `app_python_image` if you built your own image.
      - Use `smorenapi/app_python:latest` if you pulled the image from my repository
   - You can also include `-d` to run a container in the background
       (detached mode).

### Kotlin image

#### Build Kotlin image

- Open your terminal. Your directory should be the root: `pwd`: **/DevOps_Innopolis**
- Build image: `docker build -t app_kotlin_image app_kotlin`
   - `app_kotlin_image` - image name. You can change it whatever you want.
   - `app_kotlin` - the folder in which the `Dockerfile` is placed.
     > In case you are already in the **/app_kotlin** folder, you can use this
  command `docker build -t app_kotlin_image .`

#### Pull Kotlin image

- In case you don't want to build an image, you can pull the already
  pushed image in the docker
  hub: [app_kotlin](https://hub.docker.com/repository/docker/smorenapi/app_kotlin)
- Run `docker pull smorenapi/app_kotlin:latest`

#### Run Kotlin image

- You need a built or pulled image.
- Run image: `docker run --rm -p 8080:8080 --name app_kotlin <app_kotlin_image>`
   - `--rm` automatically remove the container when it exits.
  You can omit this parameter.
   - `-p` expose port 8080.
   - `--name` - container name. You can specify any name you'd like.
   - `<app_kotlin_image>` - image name.
      - Use `app_kotlin_image` if you built your own image.
      - Use `smorenapi/app_kotlin:latest` if you pulled the image from my repository
   - You can also include `-d` to run a container in the
        background (detached mode).

## Usage

### Python usage

- Run the application and open this URL in your browser: [http://127.0.0.1:8000](http://127.0.0.1:8000)
- Each time when you refresh a page you will see the actual Moscow time

![Web App](https://user-images.githubusercontent.com/49106163/188318587-e71e43a8-8bdf-46f3-a29f-f2377f4b5e86.png)

- Also, you can use
  [http://127.0.0.1:8000/healthcheck](http://127.0.0.1:8000/healthcheck)
  endpoint as a metric:

![Web App Healthcheck](https://user-images.githubusercontent.com/49106163/194942463-a822beb7-a420-4f75-a5bc-892353b81f48.png)


### Kotlin usage

- Run the application and open this URL in your browser: [http://127.0.0.1:8080](http://127.0.0.1:8080)
- Each time when you refresh a page you will see the actual Moscow time

![Web App](https://user-images.githubusercontent.com/49106163/188326480-63eefcee-88fc-4692-a234-85f34d5afd65.png)

- Also, you can use
  [http://127.0.0.1:8080/healthcheck](http://127.0.0.1:8080/healthcheck)
  endpoint as a metric:

![Web App Healthcheck](https://user-images.githubusercontent.com/49106163/194942565-61d4fdd2-8547-445a-94bd-34d9f83d83ec.png)

## Unit tests

- Right now there are unit tests that check the Moscow Time retrieving:
  time interval (that time is really updated each second)
  and HTML web page content.

### Run Python tests

- `cd app_python`
- `python -m unittest discover tests`
- Tests are in [test_msk_time_unit.py](app_python/tests/test_msk_time_unit.py)
  and
  [test_msk_time_integration.py](app_python/tests/test_msk_time_integration.py)
  files.

### Run Kotlin tests

- `cd app_kotlin`
- `./gradlew detekt`

## Linters

- to check markdown files I used
  [Markdown lint](https://github.com/markdownlint/markdownlint) tool
   - Install: `rake install`
   - Check: `mdl ../DevOps_Innopolis` (will argue on **Labs** files)

## CI

- I used GitHub Actions for the Continuous integration

### Python CI

- Workflow is described in [python_ci.yml](.github/workflows/python_ci.yml)
- It runs python build:
   - Download dependencies.
   - Run linter.
   - Run tests.
- Then checks for vulnerabilities.
- Finally, uploads Docker image to docker hub.

### Kotlin CI

- Workflow is described in [kotlin_ci.yml](.github/workflows/kotlin_ci.yml)
- Firstly, we set up JDK 17.
- Then run gradle build which includes tasks:
   - Download dependencies.
   - Run detekt linter.
   - Run unit tests.
- Then checks for vulnerabilities. Snyk might show warnings since there are
  new vulnerabilities which can be fixed right now because there are no
  library updates.
- Finally, uploads Docker image to docker hub.

## Contact

- **Student:** Roman Soldatov
- **Group:** B19-SD-01
- **Email:** r.soldatov@innopolis.university
