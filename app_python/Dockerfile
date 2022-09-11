# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
MAINTAINER Alexey Rakov

WORKDIR /app_python

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
CMD [ "python3", "-m" , "flask", "--app", "main.py", "run", "--host=0.0.0.0"]