FROM python:3.10.7-slim-buster

WORKDIR /app_python

COPY requirements.txt app.py PYTHON.md README.md .

RUN pip3 install -r requirements.txt

EXPOSE 3000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=3000"]