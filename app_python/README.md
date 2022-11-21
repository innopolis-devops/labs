# MoscowTimeDisplayer

[![Dependencies, Linter and Tests](https://github.com/yadariya/labs/actions/workflows/python.yaml/badge.svg)](https://github.com/yadariya/labs/actions/workflows/python.yaml)
[![Docker](https://github.com/yadariya/labs/actions/workflows/docker_python.yaml/badge.svg)](https://github.com/yadariya/labs/actions/workflows/docker_python.yaml)
[![Snyk](https://github.com/yadariya/labs/actions/workflows/snyk.yaml/badge.svg)](https://github.com/yadariya/labs/actions/workflows/snyk.yaml)

## :bulb: Overview

MoscowTimeDisplayer is simple web-application, which shows current time in Moscow in the format `HH:MM:SS`

## :rocket: Technological stack

- Flask
- Python

## :hammer: How to set up

1. clone the repository `https://github.com/yadariya/labs.git`
2. git checkout lab1
3. cd app_python

4. install required dependencies:
   `pip install -r requirements.txt`

5. run the app

in production:
`py -m gunicorn app:app`

in development:
`py -m flask run`

## :whale: Docker

I have used Docker for containerization

Image available on docker hub repository yadariya/devops

1. pull from repository: `docker pull yadariya/devops:latest`
2. run image: `docker run -p=1337:5000 yadariya/devops:latest`
3. go to `http://0.0.0.0:1337` to test it

## :pushpin: Unit tests

1. `unittest` is a standard module, which you don't need to install.
2. run the tests `python app_test.py`

## :cyclone: Continuous integration

I implement Continuous integration using GitHub Actions. I build application, do linting, run tests and build docker
image.
The workflows located in `.github/workflows/` folder.

## :pencil: Contacts

Dariya Vakhitova, project creator : d.vakhitova@innopolis.university

## :tada: Illustrations

![img.png](../img.png)
