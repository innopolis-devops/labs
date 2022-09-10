FROM python:3.8-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install python3-dev \
    && apt-get -y install build-essential

RUN pip install flask==2.2.2 uwsgi==2.0.20 --src /usr/local/src

COPY . /opt/flask_app
WORKDIR /opt/flask_app
RUN pip install -r requirements.txt --src /usr/local/src