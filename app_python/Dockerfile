FROM python:3.8-alpine

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

RUN mkdir /code/log

RUN adduser -D pythonapp && chown -R pythonapp /code

USER pythonapp

EXPOSE 80

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
