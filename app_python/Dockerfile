FROM python:3.10-slim as builder
WORKDIR /app

# Requirements installation
COPY ./requirements.txt /tmp
RUN python -m venv .venv && \
    ./.venv/bin/python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    ./.venv/bin/python -m pip install --no-cache-dir -r /tmp/requirements.txt

FROM python:3.10-alpine as runner
WORKDIR /app

# Copy venv with packages
COPY --from=builder /app/.venv ./.venv

# Non-root user creation
RUN addgroup -S app && adduser -S app -G app

# Copy app files
COPY ./app ./app
COPY ./.env ./

# Use a newly created user
USER app
EXPOSE 8000

# Run gunicorn from venv 
CMD ["./.venv/bin/gunicorn", "--config", "./app/config/gunicorn.conf.py", "app.api:app"]