# Python App

## App Description

This app shows the current time in Moscow

## Installing 

First, create a virtual environment for the project:

`python3 -m venv venv`

and activate it using the appropiate command for your OS.

The dependencies are listed in the requirements.txt file (using pip freeze) and can be installed using:

`pip install -r requirements.txt`

## Run

Either run the app directly from the command line:

`python3 app.py`

## Docker

you can also run the application through docker using 

```
    docker run -p 8080:8080 -d tasneemtoolba/app_python
```

## Testing 

run the tests using the entrypoint:

```
    python3 -m pytest
```