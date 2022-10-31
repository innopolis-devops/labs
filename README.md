# Lab 1: Web Application

![python workflow](https://github.com/emileyray/devops-labs/actions/workflows/python.yml/badge.svg)

![docker workflow](https://github.com/emileyray/devops-labs/actions/workflows/docker.yml/badge.svg)

## Overview

This is a simple web application that shows current time in Moscow. Time is updated whenever the page is refreshed

The project contains two folders with the application implemented in two different languages:

* `app_python`: contains project implemented in python with the use of [Flask](https://flask.palletsprojects.com/en/2.2.x/quickstart/) framework

* `app_python`: contains project implemented in dart with the use of [Flutter](https://flutter.dev/) framework

## Build

### Python Build

* Install Flask: `pip install Flask`
* Go to `app_python` folder
* Set path `FLASK_APP` equal to `app.py` in your environment
* Run `python -m flask run`
* Go to [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser
* Enjoy!

### Flutter Build

* Install Flutter on your OS according to [instructions](https://docs.flutter.dev/get-started/install)
* Go to `app_dart` folder
* Run `flutter pub get`
* Run `flutter run -d chrome --web-renderer html --web-port=5000` (can be any other browser besides chrome)
* Enjoy!

## Usage

### Python Usage

* Build the app and open [http://127.0.0.1:5000](http://127.0.0.1:5000)
* Time will be updated whenever the page is refreshed

![image](https://user-images.githubusercontent.com/69918609/188426184-1c392fd2-9ac6-482a-bc82-ddf1a7864500.png)

### Flutter Usage

* Build the app and open [http://localhost:5000](http://localhost:5000)
* Time will be updated whenever the page is refreshed

![image](https://user-images.githubusercontent.com/69918609/188425794-8e11d746-9aa2-4d93-8f57-8632e9f4ad68.png)

## Docker

### Python Build With Docker

If you want to run a docker image, then follow the next steps:

* Install docker from [](https://docs.docker.com/engine/install/)
* Go to `app_python` folder
* Run `docker build -t flask .`
* Run `docker run -d -p 5000:5000 flask`
* Go to [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser
* Enjoy!

If you want to use a remote image:

* Go to `app_python` folder
* Run `docker run -d -p 5000:5000 emileyray/flask`
* Go to [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser
* Enjoy!

### Dart Build With Docker

If you want to run a docker image, then follow the next steps:

* Install docker from [](https://docs.docker.com/engine/install/)
* Go to `app_dart` folder
* Run `docker build -t dart .`
* Run `docker run -d -p 5000:5000 dart` (ATTENTION: It will take a hell lot of time)
* Go to [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser
* Enjoy!

If you want to use a remote image:

* Go to `app_dart` folder
* Run `docker run -d -p 5000:5000 emileyray/dart`
* Go to [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser
* Enjoy!

## Unit Tests

### Python unit tests

The test tests a function that is supposed to return current time
The test runs the function with an interval of one second and compares the results

* Test is as small as possible
* The test does not depend on the environment
* The test is readable

## Workflow

### Python workflow

The project contains a Github Actions workflow for the python app.
What it does:

* Installs dependencies
* Lint checks
* Runs tests

There is also a workflow for docker in the python project.
What it does:

* Logs in to my account
* Builds the app
* Pushes to my DockerHub

Also, the Python app CI runs only if there are changes in the `app_python` folder

### Dart workflow

The project contains a Github Actions workflow for the python app.
What it does:

* Installs dependencies
* Lint checks
* Runs tests

There is also a workflow for docker in the dart project.
What it does:

* Logs in to my account
* Builds the app
* Pushes to my DockerHub

Also, the Dart app CI runs only if there are changes in the `app_dart` folder

## Contact

* Emil Khabibullin
* e.khabibullin@innopolis.university
