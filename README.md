# TimeWeb

## About the appliction

This is a simple web application written in Python. It shows current time in Moscow. So, if you would like to know the time, just follow the **Getting Started** section.

## Getting Started

### Prerequisites

Be sure that you have all of the following requirements installed:

* python3

* pip

* gunicorn

### Installation

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

### Usage

Just run `run.py`, which will start the server:

```
bash ./run.py
```

Go to `http://127.0.0.1:50000/` and check the time!

### Tests

Go to `./app_python/tests` and run tests:

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
