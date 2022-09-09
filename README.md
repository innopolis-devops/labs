# MoscowTimeDisplayer

## :bulb: Overview

MoscowTimeDisplayer is simple web-application, which shows current time in Moscow in the format `HH:MM:SS`

## :rocket: Technological stack

- Flask
- Python

## :hammer: How to set up

1. clone the repository `https://github.com/yadariya/labs.git`
2. git checkout lab1
3. cd app_python

4. install required dependencies:
`pip install -r requirenments.txt`

5. run the app

in production:
`py -m gunicorn app:app`

in development:
`py -m flask run`

## :whale: Docker

I have used Docker for containerization 

Image available on docker hub repository yadariya/devops

1. pull from repository: `docker pull yadariya/devops:latest`
2. run image: `docker run -p=1337:5000 yadariya/devops:latest`
3. go to `http://0.0.0.0:1337` to test it


## :pencil: Contacts

Dariya Vakhitova, project creator : d.vakhitova@innopolis.university

## :tada: Illustrations

![img.png](img.png)