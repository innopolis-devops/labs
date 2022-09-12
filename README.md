# Lab 1. Web application

## Contents

- [Overview](#overview)
- [Build](#build)
- [Usage](#usage)
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
- `git checkout lab1`

### Python build

#### Installation

- Install [fastapi](https://fastapi.tiangolo.com/#installation)
  running this command: `pip install fastapi`
- Install [unicorn](https://www.uvicorn.org/#quickstart) lightweight server
  running this command: `pip install "uvicorn[standard]"`
- Install [pytz](http://pytz.sourceforge.net) for getting time
  for a particular timezone: `pip install pytz`

#### Running

- Open your terminal
- Go to the **app_python** folder: `cd app_python`
- Run application: `uvicorn main:app --reload`

### Kotlin build

- Install [JDK](https://www.oracle.com/java/technologies/downloads/)
- Install [Gradle](https://gradle.org/install/)
- Open your terminal
- Go to the **app_kotlin** folder: `cd app_kotlin`
- Run application: `./gradlew bootRun`

## Usage

### Python usage

- Run the application and open this URL in your browser: [http://127.0.0.1:8000](http://127.0.0.1:8000)
- Each time when you refresh a page you will see the actual Moscow time

![Web App](https://user-images.githubusercontent.com/49106163/188318587-e71e43a8-8bdf-46f3-a29f-f2377f4b5e86.png)

### Kotlin usage

- Run the application and open this URL in your browser: [http://127.0.0.1:8080](http://127.0.0.1:8080)
- Each time when you refresh a page you will see the actual Moscow time

![Web App](https://user-images.githubusercontent.com/49106163/188326480-63eefcee-88fc-4692-a234-85f34d5afd65.png)

## Contact

- **Student:** Roman Soldatov
- **Group:** B19-SD-01
- **Email:** r.soldatov@innopolis.university
