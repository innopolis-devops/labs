FROM python:3.8-slim-buster
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8081
COPY time_visit.txt time_visit.txt
WORKDIR /app_python
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD [ "python3", "-m" , "flask", "--app", "main.py", "run", "--host=0.0.0.0"]