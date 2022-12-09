FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="/"
WORKDIR /app_python
COPY requirements.txt /app_python/
RUN pip install -r requirements.txt
COPY . /app_python/
ENTRYPOINT python3 ./moscowtime/main_app.py runserver