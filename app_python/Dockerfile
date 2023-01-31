FROM python:3.9

COPY . /app_python
WORKDIR /app_python

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "python" ]

CMD ["app.py" ]

EXPOSE 5000