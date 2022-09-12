FROM python:3.10-slim

RUN useradd nurdaulet
WORKDIR /app/
COPY --chown=nurdaulet ./requirements.txt /app/requirements.txt

RUN pip3 install -r requirements.txt --no-cache-dir
COPY --chown=nurdaulet ./ /app

USER nurdaulet
ENTRYPOINT python3 main_app.py