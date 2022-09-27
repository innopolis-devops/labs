# TTTime

## About

Have you ever wondered "what time is currently in Moscow"?

The project TTTime is an UWA (useful web-application) - a
software that could help you to answer this question.
It displays the local Moscow time right in your browser!

## Installation

### Download the project

Clone the repo with the recent project version

```commandline
git clone https://github.com/whutao/labs.git
```

Go to the application folder

```commandline
cd labs/app_python
```

### Install python for Mac

Install home brew.

```commandline
$ /bin/bash -c "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Install python 3 if needed.

```commandline
brew install python3
```

### Setup the environment

Create a virtual environment.

```commandline
python3 -m venv venv
```

Select it

```commandline
source venv/bin/activate
```

Install requirements with pip.

```commandline
pip3 install -r requirements.txt
```

## Usage

Use the single command to run the app

```commandline
python3 tttime/app.py
```

## Docker

If you want to install the app using docker, follow the steps

### Prepare the image

Build locally (being in *app_python*)

```commandline
docker build -t whutao/tttime .
```

or pull the image from the dockerhub

```commandline
docker pull whutao/tttime
```

### Run

Run and test

```commandline
docker run -p 5050:8080 tttime
```

## Unit tests

The application is covered with unit tests. After installation, one can run

```commandline
python3 -m pytest app_python/tests
```

to run the tests and see the coverage.

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

## Contact

Roman Nabiullin

- @whuthao (telegram)
- r.nabiullin@innopolis.university (email)
