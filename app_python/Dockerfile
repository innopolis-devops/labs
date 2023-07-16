# Build stage
FROM python:3.9-alpine AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Runtime stage
FROM python:3.9-alpine

WORKDIR /app

COPY --from=builder /app .

RUN pip install flask

EXPOSE 8081

CMD ["python3", "main.py"]