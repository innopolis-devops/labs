FROM python:3.9 AS compile-image

WORKDIR /opt/app

# Install Rust to compile cryptography for ARMv7 and i386
RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq install cargo \
    && rustc --version

COPY poetry.lock pyproject.toml /opt/app/

# Install project dependencies
RUN set -ex \
    && pip install --no-cache-dir poetry==1.2.0 \
    && python -m venv .venv \
    && poetry install --only main

COPY . /opt/app/

# Install current project
RUN set -ex \
    && poetry build \
    && .venv/bin/pip install --no-deps dist/*.whl


FROM python:3.9-slim

LABEL \
    maintainer="Vladimir Markov <Markovvn1@gmail.com>" \
    description="Web application that shows current time in Moscow"

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

COPY --from=compile-image /opt/app/.venv /opt/app/.venv

RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq install wget \
    && rm -rf /var/lib/apt/lists/* \
    # Create non-root user
    && useradd -s /bin/bash python

USER python

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=10s CMD bash -c "[ \"`wget -T 1 --no-verbose -O - http://localhost/healthy`\" == \"ok\" ] || exit 1"

ENTRYPOINT [".venv/bin/uvicorn", "--host", "0.0.0.0", "--port", "80", "superclock:app"]
