FROM python:3.10

WORKDIR /app
COPY ./requirements.txt ./requirements.txt
COPY ./app ./src

RUN pip install -r requirements.txt
RUN flake8 ./src

WORKDIR /app/src

CMD [ "python", "main.py" ]