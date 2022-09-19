FROM python:3.8.14-bullseye

RUN groupadd -r user && useradd -r -g user user

USER user

WORKDIR /

COPY app_python/requirements.txt requirements.txt

USER root

RUN pip install --no-cache-dir -r requirements.txt

USER user

COPY . .

WORKDIR /moscow_time

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

EXPOSE 5000
