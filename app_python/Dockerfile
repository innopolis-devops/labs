FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY --chown=app:app app.py .

EXPOSE 8080
CMD [ "python3", "app.py"]