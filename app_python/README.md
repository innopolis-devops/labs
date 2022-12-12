# Lab 1 - Web application - Moscow time program

## Overview
The application show current time in Moscow and updates after the rerendering the browser page.1
For the fullness of information the full datetime format is showed.

## Requirements
App use Flask as a web framework, no other extra modules are needed.
To install Flask use :
    `pip install -r package.txt`
in the directory of program

## Usage
1. Launch the app while the environment is activated using
   `python time.py`
2. App wil be dispatched at http://127.0.0.1:5000

## Docker
### Prerequisites
 Make sure you have the  [Docker](https://www.docker.com/products/docker-desktop/) installed
### Starting app with local image
1. Checkout to **app_python**
2. Type `docker build . -t moscow_time `to build container
3. Type `docker run -d -p 8080:5000 moscow_time` to run the app
4. App wil be dispatched at http://127.0.0.1:8080
### Starting app with image from dockerhub
1. Download image using `docker pull romanza705/moscow_time:latest`
2. Type `docker run -d -p 8080:5000 romanza705/moscow_time:latest` to run the app
3. App wil be dispatched at http://127.0.0.1:8080


## Unit testing
1. Install dependencies from package.txt
2. Run `pytest -v` to test a program


## Contacts
telegram: @romanza705
github: romanza705

