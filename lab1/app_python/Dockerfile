FROM jjanzic/docker-python3-opencv:latest

COPY . /srv

# RUN pip3 install -r /srv/requirements.txt

WORKDIR /srv

EXPOSE 8083
ENTRYPOINT ["python3", "/srv/app.py"]