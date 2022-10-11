FROM python:3.10-alpine

WORKDIR /app

# Install python requirements and creating admin for rootless container
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    addgroup -S admins && \
    adduser -S admin -G admins

COPY . .

USER admin

EXPOSE 5000