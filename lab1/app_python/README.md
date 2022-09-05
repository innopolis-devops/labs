## Overview
A simple FastAPI/Uvicorn app that shows current time. Default timezone is *Europe/Moscow*

## Build
First, configure the environment (via the `.env` file)

```bash
$ cp .env.example .env
```

Then, make sure that you have docker and docker-compose installed. Run the following command to build the project

```bash
$ docker-compose build
```

## Running locally
Once the app is built, you can startup the server by running the following command 

```bash
$ docker-compose up
```

Now, you can access the server at http://127.0.0.1:8000

Note that the timezone is configured with the help of envs. The default is *Europe/Moscow*.
If you want to change the timezone, simply change it in the `.env` file (try *Europe/London*, *Europe/Berlin*)

## Code linting
Additionally, you can run linters (flake8, isort, and mypy) over the project code with the aid of the following command

```bash
$ docker-compose run server make lint
```

## Markdown linting

I used the built-in PyCharm Markdown linter

## Contacts
``
* Telegram: @AKurmazov
* Email: a.kurmazov@innopolis.university
