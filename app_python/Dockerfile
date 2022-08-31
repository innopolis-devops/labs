FROM python:3.8-slim

ENV \
    TERM=xterm-256color \
    \
    # Don't periodically check PyPI to determine whether a new version of pip is available for download.
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    # Disable package cache.
    PIP_NO_CACHE_DIR=off \
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
    && pip install poetry \
    && poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock /opt/app/

RUN poetry install --no-dev

COPY . /opt/app/

ENTRYPOINT ["uvicorn", "--host", "0.0.0.0", "--port", "80", "superclock:app"]
