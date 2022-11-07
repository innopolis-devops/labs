# syntax=docker/dockerfile:1

# Use official python base image
FROM python:3.9-alpine

# Specify the working directory
WORKDIR /app_python

# Copy requirements.txt into 'app_python' working directory
COPY requirements.txt requirements.txt

# Run the command to install requirements.txt.
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Expose a port that container will use
EXPOSE 8000

# Copy the source code into the working directory
COPY /app .

# Add and use non root user
RUN adduser --system --no-create-home server
USER server

# Set a command to run uvicorn server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
