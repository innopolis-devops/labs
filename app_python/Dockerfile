FROM python:3.8-slim-buster
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

LABEL maintainer = 'm.martovitsky@innopolis.universit'

WORKDIR /home/app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY time_app.py time_app.py
COPY visits.json visits.json

EXPOSE 5000

CMD ["flask", "--app", "time_app.py", "run"]