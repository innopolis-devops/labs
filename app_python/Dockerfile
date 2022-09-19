FROM python:3.8-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["gunicorn",  "--bind",  "0.0.0.0:5000", "app:app"]
EXPOSE 5000
