FROM python:3
WORKDIR /app_python
COPY requirements.txt /app_python
RUN pip install -r requirements.txt
COPY . /app_python
CMD ["python3", "-m", "flask", "--app", "main", "run", "--host=0.0.0.0"]
EXPOSE 5000