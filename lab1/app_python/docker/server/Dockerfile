FROM python:3.9.4-slim

WORKDIR app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install make

COPY poetry.lock .
COPY pyproject.toml .

RUN python -m pip install poetry==1.2.0 && poetry install

COPY /server server
