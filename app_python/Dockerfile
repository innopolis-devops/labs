# build
FROM python:3.10 as build

RUN pip install --no-cache-dir "poetry~=1.1.13" && \
    useradd --create-home user

COPY --chown=user:user ./pyproject.toml /app/pyproject.toml
COPY --chown=user:user ./poetry.lock    /app/poetry.lock

WORKDIR /app

RUN poetry export -f "requirements.txt" > requirements.txt && \
    mkdir /venv && \
    chown user:user /venv

USER user

RUN python3 -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

# main
FROM python:3.10-alpine as main

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1

RUN addgroup -S user && adduser -S user -G user
WORKDIR /app

COPY --from=build --chown=user:user /venv /venv
COPY --chown=user:user . /app

RUN apk add --no-cache curl=7.83.1-r4 && \
    mkdir -p /app/data && \
    touch data/visits.txt && \
    chown user data/visits.txt

VOLUME /app/data

USER user

HEALTHCHECK --interval=30s --timeout=5s CMD ["curl", "http://127.0.0.1:8080"]

ENTRYPOINT ["/venv/bin/python3", "/app/main.py"]
