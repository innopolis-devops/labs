FROM python:3.9-alpine
EXPOSE 5000
COPY main.py requirements.txt ./app/
RUN cd ./app/ && pip install -r requirements.txt && adduser -D app_user && chown -R root ./ && chmod -R 755 ./
USER app_user
CMD python ./app/main.py