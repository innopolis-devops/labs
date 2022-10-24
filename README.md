# Moscow current time application
![python workflow](https://github.com/Feyd-Rauth/labs/actions/workflows/python.yml/badge.svg?branch=lab3)

## Overview

Simple Python web application showing current Moscow time.
Written using [Flask](https://flask.palletsprojects.com/en/2.2.x/)

## Getting Started

### Local installation

Prerequisites:

* [Python 3.10+](https://www.python.org/downloads/)
* [pip](https://pip.pypa.io/en/stable/installation/)

To run locally:

1. Clone web application repository locally.

    ```bash
    git clone --branch lab1 https://github.com/Feyd-Rauth/labs.git
    cd labs/app_python/
    ```

2. Create virtual environment.

    ```bash
    python3 -m venv venv 
    source venv/bin/activate
    ```

3. Install packages.

    ```bash
    pip3 install -r requirements.txt
    ```

4. Run the application. Web app will open at [http://localhost:8000/](http://localhost:8000/).

    ```bash
    gunicorn msctime.app:app --reload
    ```

### Build and run with Docker

1. Pull or build

    * Pull

        ```bash
        docker pull feydrauth/msctime
        ```

    * Build locally

        ```bash
        cd app_python
        docker build -t feydrauth/msctime . 
        ```

2. Run

    ```bash
    docker run -p 8000:8000 feydrauth/msctime
    ```
