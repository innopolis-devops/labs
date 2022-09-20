
# Moscow Time Web Application

![](https://img.shields.io/github/workflow/status/Ilya-Kolomin/DevOps/PYTHON_APP_CI?style=for-the-badge)

## About The Project

This is a simple web application that shows current time in Moscow.\
_Note_: the time updates only when page refreshes.

![](https://i.imgur.com/Ss5BmUi.gif)

### Built With

* ![](https://img.shields.io/badge/python-3.8-blue?style=for-the-badge&logo=python)
* ![](https://img.shields.io/badge/flask-2.2.2-blue?style=for-the-badge&logo=flask)
* ![](https://img.shields.io/badge/jinja2-3.1.2-blue?style=for-the-badge&logo=jinja)
* ![](https://img.shields.io/badge/Gunicorn-20.1.0-blue?style=for-the-badge&logo=Gunicorn)

## Getting Started

This is a small guide how to prepare and install my project in two ways: manual and using docker.

### Manual

#### Prerequisites

First of all you will need Python interpreter. I will recommend to
install the latest one or 3.8 version at least.\
For detailed instructions, see [Official Python Website](https://www.python.org).

Optionally, you could prepare virtual environment to isolate this web application.

```shell
python3 -m venv /path/to/new/venv
# or pyvenv /path/to/new/venv
cd /path/to/new/venv
. bin/activate
```

Now you are ready to proceed with installation.

#### Installation

* Clone this project, checkout **lab2** branch, go to the `app_python` folder.

```shell
git clone https://github.com/Ilya-Kolomin/DevOps.git
cd DevOps
git checkout lab2
cd app_python
```

* Install needed dependencies.\
 You can do it manually or via command

```shell
pip3 install -r requirements.txt
```

#### Usage

Now you are ready to start the WSGI server.
In my project I use **Gunicorn**, however, since it is written on _Flask_,
the project is compatible with any other WSGI
server.

* **For production server start**:

```shell
gunicorn app:app
# or python3 -m gunicorn app:app
```

* **For development server start**:

```shell
flask --app app run
# or flask run
# or python3 -m flask run
```

In production the server will start serving on http://127.0.0.1:8000,
while in development it will listen on http://127.0.0.1:5000.

So that is how my simple web application for showing current Moscow
time can be started and used.

### Using Docker

#### Prerequisites

Installed Docker on your machine. For details visit **[this](https://www.docker.com/get-started/)**.

#### Installation

You could either pull already built Docker image or build it by yourself.

```shell
# pull image
docker pull ilyakolomin/devops_app_python

# or build it by yourself

git clone https://github.com/Ilya-Kolomin/DevOps.git
cd DevOps
git checkout lab2
cd app_python
docker build . devops_app_python
```

#### Usage

Now you could run the container with the following commands.

```shell
docker run -p 8000:8000 -d devops_app_python
# or
docker run -p 8000:8000 -d ilyakolomin/devops_app_python:<tag>
```

Congratulations, now you could visit http://127.0.0.1:8000 to see current Moscow time.

## Testing

In order to run the unit tests for my project you will need to proceed with these commands

```shell
# for normal run
python3 -m unittest test.py

# for showing additional details
python3 -m unittest test.py -v

# for running particular test
python3 -m unittest test.<Class>.<TestCase>
python3 -m unittest test.AppTests.test_main_page # example
```

## CI/CD

Currently, there is a CI pipeline that checks for tests and linters.
Also, it builds docker container and pushes it to [my hub repository](https://hub.docker.com/r/ilyakolomin/devops_app_python).

## Contact

Ilya Kolomin - @Ilya-Kolomin - i.kolomin@innopolis.university\
B19-CS-01 group at Innopolis University

Project Link: https://github.com/Ilya-Kolomin/DevOps/tree/lab1