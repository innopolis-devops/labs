FROM python:3.8-slim-buster

WORKDIR /app_python
COPY requirements.txt app_python/requirements.txt

RUN pip install --no-cache-dir -r app_python/requirements.txt

RUN addgroup --system app
RUN adduser --system --group app

COPY src/app.py app_python/app.py
COPY config.json app_python/config.json
RUN chown app:app app_python/app.py
RUN chown app:app app_python/config.json

RUN mkdir /app_python/data && \
    touch data/visits.txt && \
    chown app data/visits.txt
VOLUME /home/app/data

USER app

EXPOSE 5011

ENTRYPOINT ["python"]

CMD ["app_python/app.py"]