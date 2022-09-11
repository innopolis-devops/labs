FROM python:3.9-alpine
WORKDIR /app_python

RUN adduser -D pythonuser && chown -R pythonuser /app_python

COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir
COPY ./ ./

USER pythonuser

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0" ]