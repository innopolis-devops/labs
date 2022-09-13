FROM python:3.9

WORKDIR /server

COPY ./requirements.txt /server/requirements.txt

RUN pip3 install --no-cache-dir --upgrade -r /server/requirements.txt

COPY ./app /server/app

RUN adduser -D timeapp && chown -R timeapp /server

USER timeapp

EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
