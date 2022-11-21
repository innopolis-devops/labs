# Simple time application

## Overview

 Simple python web app, which shows current Moscow time (UTC + 3), using [Flask framework](https://flask.palletsprojects.com/en/2.2.x/quickstart/)

 ## Getting Started
 ### Build
 In order to run thr application following requirements should be preinstalled: 
 * [Python 3.8+](https://www.python.org/downloads/)
 * [pip](https://pip.pypa.io/en/stable/installation/)

 To run the application follow the instructions below:
 1. Clone repository.
     ```
     git clone https://github.com/MikhailMarch/devops
     cd devops/app_python
     ```
 2. Install packages.
     ```
     pip install -r flask>=2.2.2 pyflakes>=2.4.2 
     ```
 3. Run the application. Will be opened at [http://localhost:5000/](http://localhost:5000/).
     ```
     flask -app time_app.py run
     ```

## Docker
To use docker image follow steps below:
 1)  First, install [docker](https://docs.docker.com/engine/install/).

Building image locally:
 1) change the directory to the app_python folder
 2) then use `docker build -t time_application`
 3) then use `docker run -p 5000:5000 -d time_application`
 4) Navigate to the following [link](127.0.0.1:5000) to check

Build from docker hub image
 1) Run command `docker run -p 5000:5000 -d mikhailmarch/time_application`
 2) Navigate to the following [link](127.0.0.1:5000) to check

## Unit tests

To test the application first run `pip install -r requirements.txt`

Then execute `pytest` inside the app_python folder and see the results

## endpoints

Everytime the main endpoint (/) is accessed the visit is written into visits.json file  

/visits endpoint shows the total amount of visits and corresponding timestamps

## visits

File called visits.json contains all visits in json format 

## Contacts
Any question? telegram me @mikhailh