# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
LABEL maintainer="a.rakov@innopolis.university"

WORKDIR /app_python

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    mkdir persistent && touch persistent/visits.json

COPY . .
CMD [ "python3", "-m" , "flask", "--app", "moscow_time/main.py", "run", "--host=0.0.0.0"]