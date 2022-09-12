# Python Web server

## How to run
- The source file is called `server.py`, located in `app_python` folder
- To run server, put `python server.py` in command line locating in `app_python` directory

## Run with docker
- Create image: `docker build -t app_python:latest`
- Run container: `docker run -d -p 8080:8080 app_python`

## What this app does
- The application runs server at your localhost on 8080 port and shows current time in Moscow in index page