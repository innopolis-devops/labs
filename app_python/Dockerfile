FROM python:3.9
WORKDIR /app_python

RUN pip install pip==21.3.1
RUN pip install -U setuptools pip
ADD ./app_python/requirements.txt ./
RUN pip install -r requirements.txt
COPY ./ ./

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

