FROM python:3.9-slim

# Set up a build area
WORKDIR /app

# Copy application.
COPY . /app

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Let Docker bind to port 8080
EXPOSE 8080

# Start flask application.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "tttime.app:app", "--reload"]
