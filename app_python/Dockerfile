FROM python:3.9.14-alpine3.16

WORKDIR /pythonapp

COPY . /pythonapp

EXPOSE 3000

CMD ["python3 -m virtualenv venv", "source venv/bin/activate",
"pip install -r app_python/requirements.txt",
"uvicorn app_python.main:app"]