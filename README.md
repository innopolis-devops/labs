![CI](https://github.com/PassKeyRa/labs/actions/workflows/timeweb.yml/badge.svg)

# TimeWeb

## About the appliction

This is a simple web application written in Python. It shows current time in Moscow. So, if you would like to know the time, just follow the **Getting Started** section.

## Getting Started

### Local usage

#### Prerequisites

Be sure that you have all of the following requirements installed:

* python3

* pip

* gunicorn

#### Installation

Create a new virtual environment:

```
python3 -m venv venv
. ./venv/bin/activate
```

Go to `./timeweb` subdirectory and install requirements:

```
cd ./app_python/timeweb
pip3 install -r requirements.txt
```

#### Usage

Just run `run.py`, which will start the server:

```
bash ./run.py
```

Go to `http://127.0.0.1:50000/` and check the time!

### Docker usage

Go to `./app_python` directory

#### Pull

Get the image with the following command:

```
docker pull passkeyra/timeweb
```

#### Run

Run it on local port 50000 with:

```
docker run -p 127.0.0.1:50000:50000 passkeyra/timeweb
```

#### Custom build

If you want to build the image from Dockerfile:

```
docker build -t timeweb --network=host .
```

### Unit tests

There are 2 tests that check datetime module correct usage and 3 tests for checking web application answers to requests. Go to `./app_python/tests` and run them:

```
cd ./app_python/tests
python3 test_datetime_unittest.py
python3 test_web.py
```

## License

Distributed under the MIT License. See LICENSE.txt for more information.

## Contact

Alexey Posikera - a.posikera@innopolis.university

Telegram: @passkeyra

Feel free to write me and ask any questions
