FROM python:3.9.4-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Installing make
RUN apt-get update && apt-get -y install make

# Restricting running as root
RUN adduser --disabled-password app_python_user && chown -R app_python_user /app
USER app_python_user

# Installing poetry and project dependencies
COPY poetry.lock .
COPY pyproject.toml .

RUN python -m pip install --user --no-cache-dir poetry==1.2.0 && \
    python -m poetry install

# Copying the necessary project sources
COPY /server server
