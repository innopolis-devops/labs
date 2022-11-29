FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

# Create user and set ownership and permissions as required
RUN adduser --disabled-password --gecos "" admin && chown -R admin /app \
    && mkdir visits && chown -R admin visits

USER admin

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]