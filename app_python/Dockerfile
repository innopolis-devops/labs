FROM python:3.8-slim-buster

COPY requirements.txt app_python/requirements.txt

WORKDIR /app_python

RUN pip install -r requirements.txt

COPY app.py app_python/app.py

EXPOSE 5011

ENTRYPOINT ["python"]

CMD ["app_python/app.py"]