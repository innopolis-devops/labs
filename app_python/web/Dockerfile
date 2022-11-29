FROM igooorbb/inno-devops-flask:2.2.2

RUN useradd -u 8877 flask
USER flask

WORKDIR /home/flask

COPY app app
COPY requirements.txt requirements.txt
COPY uwsgi.ini uwsgi.ini

RUN pip install --no-cache-dir -r requirements.txt --src /usr/local/src

CMD ["uwsgi", "--ini", "uwsgi.ini"]