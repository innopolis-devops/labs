FROM python:3.10.7-slim-buster

WORKDIR /app_python

COPY . .

ENV FLASK_RUN_HOST=0.0.0.0

ENV FLASK_RUN_PORT=8081

RUN pip3 install -r requirements.txt

EXPOSE 3000

CMD [ "python3", "-m" , "flask", "--app", "app.py", "run", "--host=0.0.0.0"]

