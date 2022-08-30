FROM python:3.8.10

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT [ "gunicorn", "app:app", "-b", "0.0.0.0:8000" ]