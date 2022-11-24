FROM python:3.8-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /app_python
WORKDIR /app_python
RUN pip install --upgrade pip

COPY requirements.txt /app_python/
RUN pip install -r requirements.txt
COPY . /app_python/
RUN mkdir /app/data && \
    touch visits.txt && \
    chown user visits.txt

VOLUME /app/data
USER user
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]