# DevOps Home works

## Overview
This is Python web application written using Flask framework and WorldTimeAPI showing current Moscow time.

## Getting Started
### Local installation
Before running the application, please install its prerequisites:
* [Python 3.10+](https://www.python.org/downloads/)
* [pip](https://pip.pypa.io/en/stable/installation/)

To run from the master branch, follow the instructions below:
1. Clone web application repository locally.
    ```bash
    git clone https://github.com/justmark0/DevOpsIU.git
    cd DevOpsIUCourse/app_python/
    ```
2. Create virtual environment.
    ```bash
    python3 -m virtualenv venv 
    source venv/bin/activate
    ```
3. Install packages.
    ```bash
    pip install poetry
    poetry install
    ```
4. Run the application. Web app will open at [http://localhost:8000/](http://localhost:8000/).
    ```bash
    export FLASK_APP=app
    flask run --host 0.0.0.0 -p 8000
    ```

## Run via Docker
Before running the application, please install its prerequisites:

[Docker](https://docs.docker.com/get-docker/)

1. Clone web application repository locally.
    ```bash
    git clone https://github.com/justmark0/DevOpsIU.git
    cd DevOpsIUCourse/app_python/
    ```
2. [Optional] Build Docker image.
   ```bash
      docker build -t justmark0/devopsiu .
   ```
3. Run the application. Web app will open at [http://localhost:8000/](http://localhost:8000/). 
   ```bash
      docker run -p 8000:8000 justmark0/devopsiu
   ```

## Unit tests:
1. Make sure that you are in the application directory:
    ```bash
    cd devops/app_python
    ```
2. Run the tests:
    ```bash
    pytest
    ```

## Usage & endpoints
Actually this app is useless, you can just google time :)

But if you want to view time in Moscow in this web app, you can run app and open [http://localhost:8000/](http://localhost:8000/).
#### / main page
Shows current Moscow time.
#### /visits page
Every time someone visits the index page, server saves IP address of client and timespamp. 
This file should be common for all processes, e.g. containers in cluster, and in the best case should handle race condition.


## CI
I had configured CI for this project. It runs tests and builds docker image. You can see it in `.github/workflows/ci.yml` file.

## Development
Use following command to set up pre-commmit hook:
```bash
pip3 install pre-commit && pre-commit install
```

## Contacts
If you need to contact me, you can find my active contacts at  [https://justmark0.me/](https://justmark0.me/).
