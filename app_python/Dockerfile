# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
LABEL maintainer="a.drenyasova@innopolis.university"

ENV PYTHONDONTWRITEBYTECODE 1

RUN useradd -ms /bin/bash app

WORKDIR /home/app

COPY . .
RUN pip install -r requirements.txt

USER app

ENTRYPOINT [ "python" ]
CMD [ "app.py" ]