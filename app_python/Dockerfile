FROM python:3.7.14-alpine

RUN adduser -D python && addgroup python python
RUN mkdir /app && chown python:python /app

WORKDIR /app

COPY --chown=python:python timeweb/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=python:python timeweb/timeweb.py timeweb/wsgi.py /app/
RUN mkdir /data && chown python:python /data

USER python

EXPOSE 50000

CMD ["gunicorn", "--workers", "5", "--bind", "0.0.0.0:50000", "wsgi:app"]
