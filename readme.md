# Lab 1 - Moscow Time Web Application

## Overview

This application shows Moscow time on request

## Build

To build it, first clone this repository.

Then, go to `/app_python` and run `pip install -r requirements.txt`

After that, just run `flask run` and you good to go.

## Usage

To get time in Moscow timezone, just send GET request to `http://localhost:5000/time/moscow`

To record your visit, send GET request to `/` route
To get all visits, send GET to `/visits` and receive array of visit times.

## Usage (Docker)

If you want to run this app in Docker container, just use this:

```
docker run -p 5000:5000 zyymee/moscow-time-web-app:0.0.4
```

## Unit tests

To run unit tests just use `pytest` command.

## Contact

If you have any questions or ideas on how to improve this application, feel free to write me on here.