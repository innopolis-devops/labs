# Moscow current time application

## Overview

Simple Python web application showing current Moscow time.
Written using [Flask](https://flask.palletsprojects.com/en/2.2.x/) and [WorldTimeAPI](http://worldtimeapi.org)

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
