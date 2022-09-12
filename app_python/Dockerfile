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

USER user

ENTRYPOINT ["/venv/bin/python3", "/app/main.py"]
