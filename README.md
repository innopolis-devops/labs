# Kremlin chimes

![app_python](https://github.com/danmory/devops_labs/actions/workflows/app_python.yaml/badge.svg)
![app_go](https://github.com/danmory/devops_labs/actions/workflows/app_go.yaml/badge.svg)

## Description

The application shows the current Moscow time.

The application written using two different technologies:

1. Python and FastAPI framework *(app_python)*
2. GO and Gin framework *(app_go)*

## Python version of the application

### [Python] - Requirements

1. [python 3.10](https://www.python.org/downloads/)
2. [pip](https://pip.pypa.io/en/stable/installation/)
3. Installed python libraries specified in *requirements.txt*

### [Python] - Usage

1. Clone the repository

2. (Optional) Create and activate virtual environment

    ``$ python3.10 -m venv venv``

    ``$ source venv/bin/activate``

3. Enter application directory

    ``$ cd app_python``

4. Setup all requirements

    ``$ pip install -r requirements.txt``

5. Start the application

    ``uvicorn main:app``

6. The application will run on <http://127.0.0.1:8000>

### [Python] - Usage with Docker

1. Clone the repository

2. Enter application directory

    ``$ cd app_python``

3. Build the image

    `` $ docker build -t app_python . ``

    OR

    install image from Docker hub

    `` $ docker pull danmory/python_kremlin_chimes ``

4. Run the container based on the image

    `` $ docker run -d --rm -p 8000:8000 --name fastapi_server <image_name> ``

    where *image_name* either *app_python* or *danmory/python_kremlin_chimes*

5. The application will run on <http://127.0.0.1:8000>

### [Python] - Unit Tests

1. Setup all requirements

    ``$ pip install -r requirements.txt``

2. Run

    ``$ pytest app_python``

### [Python] - Endpoints

1. / - Get Moscow Time

2. /visits - Get Visitors IP addresses

3. /metrics - Get metrics

## GO version of the application

### [GO] - Requirements

1. [GO 1.19](https://go.dev/doc/install)
2. Installed dependencies specified in *go.mod*

### [GO] - Usage

1. Clone the repository

2. Enter application directory

    ``$ cd app_go``

3. Setup all requirements

    ``$ go mod download``

4. Start the application

    DEBUG mode - ``$ go run .``

    PRODUCTION mode - ``$ GIN_MODE=release go run .``

5. The application will run on <http://127.0.0.1:8080>

### [GO] - Usage with Docker

1. Clone the repository

2. Enter application directory

    ``$ cd app_go``

3. Build the image

    `` $ docker build --file Dockerfile.multistage -t app_go . ``

    OR

    install image from Docker hub

    `` $ docker pull danmory/go_kremlin_chimes ``

4. Run the container based on the image

    `` $ docker run -d --rm -p 8080:8080 --name gin_server <image_name> ``

    where *image_name* either *app_go* or *danmory/go_kremlin_chimes*

5. The application will run on <http://127.0.0.1:8080>

### [GO] - Unit Tests

1. Enter application directory

    ``$ cd app_go``

2. Setup all requirements

    ``$ go mod download``

3. Run tests

    `` $ go test . ``

### [GO] - Endpoints

1. / - Get Moscow Time

2. /visits - Get Visitors IP addresses

3. /metrics - Get metrics

## Authors and contacts

Danila Moriakov(d.moriakov@innopolis.university)
