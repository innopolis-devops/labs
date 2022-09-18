# Current Moscow Time application
![CI workflow](https://github.com/AlexDest-Dev/devops/actions/workflows/python.yaml/badge.svg?style=for-the-badge)

## Table of content
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Docker](#docker)
- [Contact](#contact)

## Description

This application created for showing current time from [WorldTimeAPI](http://worldtimeapi.org/). Application written with using **Python** + **Flask**

## Installation

- Install [Python](https://python.org)
- Create virtual environment: \
  `python3 -m venv venv`
- Activate it using commands: \
  **Windows**: \
  `venv\Scripts\activate.bat` \
  **Linux&MacOS**: \
  `source venv/bin/activate`
- Install requirements: \
  `pip install -r requirements.txt`

## Usage

- Go to app_python directory \\
- Write:
  ```
  python main.py
  ```
- Open link to see current time:
  ```
  http://127.0.0.1:5000
  ```

## Docker
#### Building on local machine
- Install [Docker](https://www.docker.com/products/docker-desktop/) for your platform
- Clone or download repo
- Go to **app_python** folder
- Use `docker build ./ moscow_time` for building docker image
- Use `docker run -d -p 5000:5000 moscow_time:latest` for starting application
- Go to `http://127.0.0.1:5000` and look at current Moscow time
#### Start from ready image
- Install [Docker](https://www.docker.com/products/docker-desktop/) for your platform
- Use `docker pull alexdestdev/moscow_time:0.1` to get builded image
- Use `docker run -d -p 5000:5000 alexdestdev/moscow_time:0.1` for starting application
- Go to `http://127.0.0.1:5000` and look at current Moscow time
## Contact
Alexey Rakov, BS19-SD-01 \
email: a.rakov@innopolis.university
