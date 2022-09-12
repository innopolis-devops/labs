# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

ENV FLASK_APP=main.py

RUN useradd -ms /bin/bash python_app
WORKDIR /home/python_app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
USER python_app

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]