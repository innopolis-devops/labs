FROM python:3.10-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

COPY . .

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0"]