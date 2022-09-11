FROM python:3.9-slim

RUN mkdir -p /app

WORKDIR /app

RUN useradd -m runner && chown -R runner /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY app.py .
COPY templates/ ./templates/

EXPOSE 8000

USER runner

ENTRYPOINT [ "gunicorn", "-b", "0.0.0.0:8000", "app:app"]

