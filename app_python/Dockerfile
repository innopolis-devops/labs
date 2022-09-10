FROM python:3.8-slim

COPY . /opt/flask_app
WORKDIR /opt/flask_app

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

RUN pip install -r requirements.txt --src /usr/local/src

COPY nginx.conf /etc/nginx
RUN chmod +x ./run.sh
CMD ["./run.sh"]
