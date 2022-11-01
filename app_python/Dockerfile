FROM python:3.9

WORKDIR /server

COPY ./requirements.txt /server/requirements.txt

RUN pip3 install --no-cache-dir --upgrade -r /server/requirements.txt

COPY ./app /server/app

RUN adduser --disabled-login timeapp && chown -R timeapp /server

USER timeapp

EXPOSE 8080

WORKDIR /server/app

CMD ["uvicorn", "main:fast_api", "--reload", "--host", "0.0.0.0", "--port", "8080"]
