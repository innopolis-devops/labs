FROM python:3.9-alpine
EXPOSE 5000
COPY app_python/main.py app_python/requirements.txt /app/
WORKDIR app
RUN pip install -r requirements.txt && adduser -D app_user && chown -R root ./ && chmod -R 755 ./
USER app_user
CMD python main.py