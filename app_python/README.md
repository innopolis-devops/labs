# Time show web application

## Overview
The is simple application that shows current MSK time.

## Build
To run the application follow the instructions below:
 1. Clone repository.
     ```
     git clone https://github.com/Dablup/devops_labs
     ```
 2. Install packages.
     ```
     pip install -r flask>=2.2.2 pyflakes>=2.4.2 
     ```
 3. Run the application. Will be opened at [http://localhost:5000/](http://localhost:5000/).
     ```
     flask --app time_app.py run
     ```
    
## Usage

1. Open web page at http://localhost:5000/
2. It will show time.
3. When you update page, time is also will be updated.

## Docker

If you want to use Docker with that project you need follow several steps:
1) [Install docker](https://docs.docker.com/engine/install/).

If you want to build an image locally then:
1) Navigate to the root folder of the project (in our case it is app_python)
2) Run command `docker build -t time_flask_app:v0.2 .`
3) Run commnad `docker run -p 5000:5000 -d time_flask_app:v0.2` (First 5000 is port of local machine and second 5000 is a port where application will be running inside container)
4) Now application is running inside container and forwarded to the http://localhost:5000

If you want to use image from Docker Hub Repository:
1) Run command `docker run -p 5000:5000 -d dablup/devops_labs:devops_labs`
2) Now application is running inside container and forwarded to the http://localhost:5000

## Unit test 
Unit test is a software development process in which the smallest testable parts of an application, called units, are individually and independently scrutinized for proper operation.

In my application for unit testing I used [pytest](https://docs.pytest.org/en/7.1.x/).
To run it you need:
1) Install pytest using command `pip install -r requirements.txt`
2) Run command `pytest test.py` inside `app_python` directory
## Contacts 

[Daniil Livitin](https://github.com/Dablup)

Email: d.livitin@innopolis.university

Tg: [@Dablup](https://t.me/Dablup)
