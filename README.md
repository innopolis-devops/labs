# Sample Time App
> Shows current time in Moscow

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Setup](#setup)
* [Usage](#usage)


## General Information
- Simple Python server app that can be used to know current time in Moscow
- Show time at the moment of request
- Reload page to update time


## Technologies Used
- Python 3
- Flask framework for web application
- [pytz](https://pypi.org/project/pytz/) for timezone requests


## Setup
To run server you will need a `Python3` environment with `pip` installed.

Install a Flask framework and pytz library using:

```pip install flask pytz```


## Usage
To run the application, use the flask command:

```flask --app app_python/main run```

It will launch the server and show something like:
```
 * Serving Flask app 'app_python/main'
 * Debug mode: off
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
```
Server provides you with a local IP address to the server that can open in your browser and test the app.
