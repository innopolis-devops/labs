FROM python:3.10

WORKDIR /app

RUN pip3 install flask

COPY . .

ENV FLASK_APP=app

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
