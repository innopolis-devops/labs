# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
LABEL maintainer="a.drenyasova@innopolis.university"

ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

ENV VIRTUAL_ENV=/opt/venv \
    PYTHONDONTWRITEBYTECODE=1
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apk add --no-cache gcc musl-dev && \
    python3 -m venv $VIRTUAL_ENV  && \
    chmod -R a+rwX $VIRTUAL_ENV

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir wheel -r /app/requirements.txt

EXPOSE 8000

COPY . /app
RUN mkdir /app/moscow_time/volume && \
    adduser --disabled-password app && \
    chown -R appuser /app

USER appuser

WORKDIR /app/moscow_time
CMD [ "python3", "-m" , "flask", "run", "--host", "0.0.0.0", "--port", "8000"]
