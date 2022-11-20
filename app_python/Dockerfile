FROM python:3.9-slim

ENV PROD=true \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100

RUN apt-get update && \
  apt-get install -y wget && \
  python -m pip install --no-cache-dir poetry==1.2.0

WORKDIR /app
COPY poetry.lock pyproject.toml /app/


RUN python -m poetry config virtualenvs.create false \
  && python -m poetry install --no-interaction --no-ansi \
  && python -m poetry shell

COPY . /app



RUN adduser --system --no-create-home appuser && \
  mkdir /app/storage && \
  touch /app/storage/visits.json && \
  chown appuser /app/storage/visits.json
USER appuser

HEALTHCHECK --interval=5m --timeout=3s CMD wget --no-verbose --tries=3 --spider http://localhost:4444/health || exit 1

ENTRYPOINT ["gunicorn", "src.wsgi:app"]
CMD ["-b", "0.0.0.0:4444"]
