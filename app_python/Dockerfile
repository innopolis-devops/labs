FROM python:3-alpine
USER root
WORKDIR /main

COPY app_python/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8081

CMD ["python3", "main.py"]


