FROM python:3.8-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirenments.txt
CMD ["gunicorn",  "--bind",  "0.0.0.0:5000", "app:app"]
EXPOSE 5000