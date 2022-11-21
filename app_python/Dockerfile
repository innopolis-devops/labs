FROM python:3.10.7-buster
LABEL maintainer="i@justmark0.me"

ENV PYTHONDONTWRITEBYTECODE=1
ENV FLASK_APP=msk_time/app.py

RUN useradd -ms /bin/bash app
WORKDIR /home/app

RUN pip install --upgrade pip poetry==1.1.11 && poetry config virtualenvs.create false
RUN mkdir /home/app/data && \
    touch data/visits.txt && \
    chown app data/visits.txt
VOLUME /home/app/data
COPY . .
RUN poetry install --no-dev


EXPOSE 8000
USER app

CMD ["flask", "run",  "--host", "0.0.0.0", "--port", "8000"]
