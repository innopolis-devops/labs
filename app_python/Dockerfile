FROM python:3.9-alpine
COPY app_python/app.py app_python/requirements.txt /app/
WORKDIR app
RUN pip install -r requirements.txt && adduser -D app_user && chown -R root ./ && chmod -R 755 ./
USER app_user

EXPOSE 8080
CMD [ "python", "./app.py" ]
