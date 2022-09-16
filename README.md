# DevOps Labs

## Overview
This is Python web application written using Flask framework and WorldTimeAPI that shows current Moscow time.

## Getting Started
### Local installation
Before running the application, install its prerequisites:
* [Python 3.10+](https://www.python.org/downloads/)
* [pip](https://pip.pypa.io/en/stable/installation/)

To run from the master branch, follow the instructions below:
1. Clone web application repository locally.
    ```bash
    git clone https://github.com/nailyav/DevOps-labs.git
    ```
2. Create virtual environment.
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```
3. Install packages.
    ```bash
    pip install poetry
    poetry install
    ```
4. Run the application. Web app will open at [http://localhost:5000/](http://localhost:5000/).
    ```bash
    cd lab1/app_python
    export FLASK_APP=app
    flask run
    ```
## Docker
To run app via docker (without logging in docker hub):
1. Build docker image
    ```
    docker build -t <image name> .
    ```
2. Run the app. It will be open at port 5000
    ```
    docker run -p 5000:5000 <image name>
    ```
    
To run app via docker (with logging in docker hub):
1. Build docker image
    ```
    docker build -t nailyav/lab2 .
    ```
2. Run the app. It will be open at port 5000
    ```
    docker run -p 5000:5000 <image name>
    ```
3. Login to docker hub account
    ```
    docker login
    ```
4. Tag the image
    ```
    docker tag nailyav/lab2 nailyav/lab2:1.0
    ```
5. Push the image to docker hub
    ```
    docker image nailyav/lab2 push
    ```

## Usage
You can view Moscow time using this web app, just run it and open [http://localhost:5000/](http://localhost:5000/).

## Contacts
If you need to contact me, you can find my active contacts at [telegram](https://not_toxic14.me/).
