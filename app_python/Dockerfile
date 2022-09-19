FROM python:3.8-slim-buster

RUN useradd -u 8877 newuser
USER newuser

WORKDIR /
COPY app_python/requirements.txt requirements.txt

USER root

RUN pip install --no-cache-dir -r requirements.txt

USER newuser

WORKDIR /
COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
