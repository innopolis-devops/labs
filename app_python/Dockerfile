FROM python:3.9

WORKDIR /app_python

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY templates templates
COPY . .

EXPOSE 8080
CMD ["gunicorn", "wsgi:app", "--bind", "0.0.0.0:8080"]