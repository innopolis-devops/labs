# DevOps course labs at Innopolis University

![Docker](https://github.com/seytkalievm/devops_labs/actions/workflows/docker.yml/badge.svg)

![Pylint](https://github.com/seytkalievm/devops_labs/actions/workflows/lint.yml/badge.svg)

![Python package](https://github.com/seytkalievm/devops_labs/actions/workflows/build_test.yml/badge.svg)

![SNYK](https://github.com/seytkalievm/devops_labs/actions/workflows/snyk.yml/badge.svg)

## Overview

This is Python web application written using [FlaskAPI framework]
(<https://flask.palletsprojects.com/en/2.2.x/>)

## Getting Started

### Local installation

Before running the application, please install its prerequisites:

* [Python 3.6+](https://www.python.org/downloads/)
* [pip](https://pip.pypa.io/en/stable/installation/)

To run from the master branch, follow the instructions below:

1. Clone web application repository locally.

    ```bash
    git clone https://github.com/seytkalievm/devops_labs
    cd devops_labs/app_python/
    ```

1. Install packages.

    ```bash
    pip install -r requirements.txt
    ```

1. Run the application. Web app will be open at
 [http://localhost:5000/](<http://localhost:5000/>):

    ``` bash
    cd moscow_time
    flask run
    ```

## Docker Installation

Before running the application, please install its prerequisites:

* [Docker 20.10.7+](<https://docs.docker.com/get-docker/>)

To run from the master branch, follow the instructions below:

1. Pull docker image with web application:

    ```bash
    docker pull seytkalievm/devops_lab
    ```

1. Run the container. Web app will open at [http://localhost:5000/](http://localhost:5000/).

    ```bash
    docker run -p 5000:5000 seytkalievm/devops_lab
    ```

## Unit Testing

To run test, first navigate to the test directory:

```bash
cd app_python/test
```

then run test:

```bash
python unit_test.py
```

## Contacts

If you have any questions or ideas, write me in Telegram:
 [@seytkalievm](<https://t.me/seytkalievm/>)
