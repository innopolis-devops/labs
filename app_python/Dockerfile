FROM python:3.10
WORKDIR /app

# Requirements installation (to the newly created venv)
COPY ./requirements.txt /tmp
RUN python -m venv .venv && \
    ./.venv/bin/python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    ./.venv/bin/python -m pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Non-root user creation
RUN groupadd app && useradd app -g app

# Copy app files
COPY ./app ./app

# Use a newly created user
USER app
EXPOSE 8000

# Run gunicorn from venv 
ENTRYPOINT ["./.venv/bin/gunicorn", "--config", "./app/config/gunicorn.conf.py", "app.api:app"]