FROM python:3-alpine

WORKDIR /main

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8081

CMD ["python3", "main.py"]


