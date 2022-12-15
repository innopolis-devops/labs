FROM python:3.9.6-slim-buster

RUN adduser --disabled-password app && chown -R app /home/app

WORKDIR /home/app

# Install required packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

USER app

# Copy the main code
COPY --chown=app:app app.py .

EXPOSE 5000

CMD [ "gunicorn", "-b", "0.0.0.0:5000", "--access-logfile", "-", "app:app" ]