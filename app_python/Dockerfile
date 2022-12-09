FROM python:3.9-alpine
WORKDIR /flask-app

RUN adduser -D app_user

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

#copy all from app_python to a new folder flask-app/app_python
COPY .. .

USER app_user

EXPOSE 8080
CMD [ "python", "./app.py" ]
