FROM python:3.8-slim-buster

RUN useradd -u 8877 newuser
USER newuser

WORKDIR /

USER root

COPY requirements.txt requirements.txt

COPY saved_visits.json saved_visits.json

RUN pip install --no-cache-dir -r requirements.txt

USER newuser

WORKDIR /
COPY . .
data
USER root

ENV FLASK_APP=app.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]