FROM python:3.9-alpine

WORKDIR /app_python

RUN pip install --no-cache-dir Flask==2.2.2

COPY . /app_python

ENTRYPOINT [ "python" ]

CMD ["app.py" ]