# syntax=docker/dockerfile:1

# Build an image starting with the Python 3.10.7 image
FROM python:3.10.7-alpine as builder

# Add metadata how to contact the maintainer
LABEL maintainer="a.khusnutdinova@innopolis.university"

# Set the working directory to /app
WORKDIR /app

# Activate the virtualenv and set the appropriate environment variables: 
ENV VIRTUAL_ENV=/opt/venv \
    PYTHONDONTWRITEBYTECODE=1
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install gcc and other dependencies and create a non-root user
RUN apk add --no-cache gcc musl-dev && \
    python3 -m venv $VIRTUAL_ENV  && \
    chmod -R a+rwx $VIRTUAL_ENV && \
    adduser --disabled-password appuser

USER appuser

# Copy requirements.txt and install the Python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir wheel -r requirements.txt

# Add metadata that the container is listening on port 8000
EXPOSE 8000

# Copy the current directory . in the project to the workdir .
COPY . .

# Set the working directory to /app/src
WORKDIR /app/src

# Set the default command for the container
CMD [ "python3", "-m" , "flask", "run", "--host", "0.0.0.0", "--port", "8000"]