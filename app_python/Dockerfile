FROM python:3.9-alpine

WORKDIR /app_python

COPY requirements.txt /app_python/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app_python

ENTRYPOINT [ "python" ]

CMD ["app.py" ]
