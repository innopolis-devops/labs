FROM python:3.8-slim

ENV \
    TERM=xterm-256color \
    \
    # Don't periodically check PyPI to determine whether a new version of pip is available for download.
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    # Disable package cache.
    PIP_NO_CACHE_DIR=on \
    # Python won’t try to write .pyc files on the import of source modules.
    PYTHONDONTWRITEBYTECODE=on \
    # install a handler for SIGSEGV, SIGFPE, SIGABRT, SIGBUS and SIGILL signals to dump the Python traceback
    PYTHONFAULTHANDLER=on \
    # Force the stdout and stderr streams to be unbuffered.
    PYTHONUNBUFFERED=on \
    # set workdir as PYTHONPATH
    PYTHONPATH=/opt/app

STOPSIGNAL SIGINT

WORKDIR /opt/app

RUN set -ex \
    # Install and configure poetry
    && pip install --no-cache-dir poetry==1.2.0 \
    && poetry config virtualenvs.create false \
    # Create non-root user
    && useradd -s /bin/bash python

COPY pyproject.toml poetry.lock /opt/app/

RUN poetry install --no-dev

USER python

COPY . /opt/app/

EXPOSE 80

ENTRYPOINT ["uvicorn", "--host", "0.0.0.0", "--port", "80", "superclock:app"]
