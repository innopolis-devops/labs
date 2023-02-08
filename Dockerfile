FROM python:3
WORKDIR .
COPY app_python/requirements.txt app_python/
RUN pip install -r app_python/requirements.txt
COPY . .
CMD ["python3", "-m", "flask", "--app", "app_python/main", "run", "--host=0.0.0.0"]
EXPOSE 5000
