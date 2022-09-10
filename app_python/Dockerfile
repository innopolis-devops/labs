FROM python

WORKDIR /pythonapp

COPY . /pythonapp

EXPOSE 3000

CMD ["python3 -m virtualenv venv", "source venv/bin/activate",
"pip install -r app_python/requirements.txt",
"uvicorn app_python.main:app"]