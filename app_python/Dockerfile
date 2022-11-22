FROM python:3.9

WORKDIR /home/app

RUN adduser --disabled-login timeapp && chown -R timeapp /home

COPY ./requirements.txt /home/app/requirements.txt

RUN pip3 install --no-cache-dir --upgrade -r /home/app/requirements.txt

RUN mkdir /home/app/data && \
    touch data/visits.txt && \
    chown timeapp data/visits.txt

COPY . .



USER timeapp




WORKDIR /home/app

CMD ["uvicorn", "app.main:fast_api", "--reload", "--host", "0.0.0.0", "--port", "8080"]
EXPOSE 8080