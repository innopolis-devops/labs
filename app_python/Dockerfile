FROM python:3.10-slim-buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

COPY . .

HEALTHCHECK --interval=10s --timeout=10s --retries=2 CMD curl -sS 127.0.0.1:8000 || exit 1

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0"]
