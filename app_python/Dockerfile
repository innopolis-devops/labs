FROM python:3.9-alpine

WORKDIR /app_python

COPY requirements.txt /.

RUN pip install --no-cache-dir requirements.txt

COPY . /app_python

ENTRYPOINT [ "python" ]

CMD ["app.py" ]