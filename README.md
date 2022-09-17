# Time Checker

![badge](https://github.com/ParfenovIgor/labs/actions/workflows/app_python.yml/badge.svg?branch=lab3)
![badge](https://github.com/ParfenovIgor/labs/actions/workflows/app_php.yml/badge.svg?branch=lab3)

## Author

Igor Parfenov

Contact: [@Igor_Parfenov](https://t.me/Igor_Parfenov)

## Overview

This is a local web application, which prints the current datetime in Moscow.

## Local Build

The application requires `Python-3.8+` , `pip` and `Python Virtual Environment` package.
Author build in `Debian-11`:

* `cd app_python`
* `python3 -m venv venv`
* `source venv/bin/activate`
* `python3 -m pip install -r requirements.txt`
* `python3 main.py`

## Local Usage

After these operations, the web application can be seen through address `127.0.0.1:8080`.

## Docker Build

* Install [Docker](https://docs.docker.com/). The instruction depends on your OS.
* `cd app_python`
* `sudo docker build .` Use `ID` mentioned in last line of output in next command.
* `sudo docker run <ID>`

## Docker Usage

After these operations, the web application can be seen though address, which is
written in output of `Flask` in terminal.

## Docker Hub Image

* `sudo docker run -p 80:8080 igorparfenov/devops_lab:app_python`

## Unit Tests

The program `pytest` was used.

Installation `python3 -m pip install pytest`

Usage `pytest main.py`

## Github Actions CI

The Github Actions CI was set. The result of last push testing can be checked by badges on the top.

CI runs:

* Linter
* Unit Testing
* Vulnerability Testing
* Docker Image Building

CI uses cache to accelerate build.
