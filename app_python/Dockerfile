# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
LABEL maintainer="a.drenyasova@innopolis.university"

ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /home/app

ENV VIRTUAL_ENV=/opt/venv \
    PYTHONDONTWRITEBYTECODE=1
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apk add --no-cache gcc musl-dev && \
    python3 -m venv $VIRTUAL_ENV  && \
    chown -R appuser /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

EXPOSE 8000

COPY . /app
RUN mkdir /app/src/volume && \
    adduser --disabled-password app && \
    chown -R app /app

USER app

WORKDIR /app/moscow_time

ENTRYPOINT [ "python" ]
CMD [ "main.py" ]
