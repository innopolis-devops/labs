FROM igooorbb/inno-devops-flask:2.2.2

COPY app /opt/flask_app/app
COPY requirements.txt /opt/flask_app/requirements.txt
COPY uwsgi.ini /opt/flask_app/uwsgi.ini

WORKDIR /opt/flask_app
RUN pip install --no-cache-dir -r requirements.txt --src /usr/local/src

CMD ["uwsgi", "--ini", "uwsgi.ini"]