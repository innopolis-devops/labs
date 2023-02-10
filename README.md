# Moscow Time App

## Description
A python app that shows Moscow time

## Usage
Run app.py

App wil be dispatched at http://127.0.0.1:5000
 
## Docker
Install Docker

Run `docker run -p 5000:5000 -d tiny0wizard/time-app:latest`

Go to http://localhost:5000/

## Unit Tests

Run test_app

## Github workflow

Github actions installs dependencies, lints with flake8 and tests with pytest

Docker part of the workflow log-ins to Docker Hub, sets up a Docker Buildx, builds and pushes

## Visits

Go to http://localhost:5000/ to see the number of visits to the main page
