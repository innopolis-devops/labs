FROM python:3.8-slim-buster
WORKDIR /app_python
COPY requirements.txt /app_python
RUN pip3 install --upgrade pip -r requirements.txt
COPY . /app_python
EXPOSE 5000
CMD ["python3", "-m", "flask", "--app", "main_app/main.py", "run", "--host=0.0.0.0"]
