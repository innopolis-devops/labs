FROM python:3.8-slim
WORKDIR /usr/src/app
COPY requirenments.txt ./
RUN pip install -r requirenments.txt
COPY . .
EXPOSE 5000
CMD ["gunicorn",  "--bind",  "0.0.0.0:5000", "app:app"]