FROM python:3.9-alpine
WORKDIR /app

RUN adduser -D pythonuser && chown -R pythonuser /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

USER app_user

EXPOSE 8080

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
