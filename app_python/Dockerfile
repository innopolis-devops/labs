FROM python:3.10.7-slim-buster

WORKDIR /app_python

COPY . .

RUN pip3 install -r requirements.txt

ENV FLASK_RUN_HOST=0.0.0.0

ENV FLASK_RUN_PORT=8081


EXPOSE 3000

CMD [ "python3", "-m" , "flask", "--app", "app.py", "run", "--host=0.0.0.0"]

