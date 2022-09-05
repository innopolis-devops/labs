# Kremlin chimes

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

## Authors and contacts

Danila Moriakov(d.moriakov@innopolis.university)
