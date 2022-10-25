# Official Python runtime, used as the parent image
FROM python:3.10-alpine

ENV PROJECT_DIR "/app"
ENV APP_USER "app"

# Setting the working directory in the container to /app
WORKDIR /app

COPY requirements.txt .

# Installing requirements and creating user for rootless container
RUN pip install --no-cache-dir -r requirements.txt && \
    addgroup -S mygroup && \
    adduser -S myuser -G mygroup

# Copying all files to working directory. '.dockerignore' will ignore unnecessary files
COPY . .

# Updating RWX access on time.txt file
RUN chmod 777 /app/files/time.txt

# Unblocking port 5000 for the Flask app to run on
EXPOSE 8080

# Activating the user
USER myuser

# Using the default python interpreter
ENTRYPOINT [ "python" ]

# Passing 'app.py' argument to the python interpreter
CMD [ "app.py" ]
