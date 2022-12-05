FROM python:3.7
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN mkdir data && touch data/visits.log
CMD ["gunicorn",  "--bind",  "0.0.0.0:5000", "app:flask_app"]
EXPOSE 5000
