FROM python:3.8.10

WORKDIR /app

COPY src/* requirements.txt /app/

RUN pip install -r requirements.txt

ENTRYPOINT [ "gunicorn", "app:app", "-b" ]
CMD [ "-b", "0.0.0.0:8000" ]