FROM python:3.8-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /app_python
WORKDIR /app_python
RUN pip install --upgrade pip


COPY requirements.txt /app_python/
RUN pip install -r requirements.txt
COPY . /app_python/


HEALTHCHECK --interval=30s --timeout=5s CMD ["curl", "http://127.0.0.1:8000"]

EXPOSE 8080
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]