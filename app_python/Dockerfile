FROM python:3.9

WORKDIR /app_python

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8081

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8081"]