FROM python:3.10-slim

RUN useradd nurdaulet
WORKDIR /app_python/
COPY --chown=nurdaulet ./requirements.txt /app_python/requirements.txt

RUN pip3 install -r requirements.txt --no-cache-dir
COPY --chown=nurdaulet ./ /app_python

USER nurdaulet
ENTRYPOINT python3 ./moscowtime/main_app.py