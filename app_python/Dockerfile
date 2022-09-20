FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
COPY requirements-dev.txt requirements-dev.txt

RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements-dev.txt

COPY . .

CMD [ "python3", "app.py"]