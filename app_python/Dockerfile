FROM python:3.9-slim
WORKDIR /app
COPY ./tttime /app/tttime
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "tttime.app:app", "--reload"]
