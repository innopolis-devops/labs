# Get current Moscow time web application

## Overview

Application uses 'pytz' library to get Moscow timezone and then prints the formated time.

## Setting up on Windows machine

1. Check whether python installed on your machine.
2. Checkout to app_python folder.
3. Make virtual environment for the project using: \
`python3 -m venv environment`
4. Activate virtual environment using: \
**Windows:**  `environment/Scripts/activate` \
**Mac/Linux:**  `source environment/bin/activate`
5. Install dependencies using:
   `pip install -r requirements.txt`

## Usage

1. Launch the app while the environment is activated using
   `python time.py`
2. App wil be dispatched at http://127.0.0.1:5000
3. There is /visits endpoint, it shows time of previous accesses to root endpoint.

## Unit testing 

1. Install dependencies
2. Run `pytest -v`

## Docker
### Prerequisites
 Make sure you have the  [Docker](https://www.docker.com/products/docker-desktop/) installed
### Starting app with local image
1. Checkout to **app_python**
2. Type `docker build . -t  current_moscow_time `to build container
3. Type `docker run -d -p 5000:5000 current_moscow_time` to run the app
4. App wil be dispatched at http://127.0.0.1:5000
### Starting app with image from dockerhub
1. Download image using `docker pull kastrylia/current_moscow_time:latest`
2. Type `docker run -d -p 5000:5000 kastrylia/current_moscow_time:latest` to run the app
3. App wil be dispatched at http://127.0.0.1:5000

## Contact

Ruslan Nurutdinov \
telegram: @Kastrylia
