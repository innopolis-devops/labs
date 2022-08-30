FROM python:3.10
WORKDIR /app


# Environment.
COPY ./docker/requirements.txt ./requirements.txt
RUN python -m venv .venv
RUN .venv/bin/python -m pip install --no-cache-dir --upgrade pip setuptools wheel
RUN .venv/bin/python -m pip install --no-cache-dir -r ./requirements.txt
RUN rm ./requirements.txt


# Executables.
COPY ./app_python ./app_python


# root evil.
RUN addgroup --system cats
RUN adduser --system floppa
RUN usermod --append --groups cats floppa

# Change owner of work dir to allow for neat triks, and kill warnings.
RUN chown floppa:cats /app

# root evil, part 2.
USER floppa


# RUN
ENTRYPOINT .venv/bin/gunicorn -k uvicorn.workers.UvicornWorker --bind=0.0.0.0:8000 app_python.main:app
