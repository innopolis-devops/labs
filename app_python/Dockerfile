FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir /usr/src/app && \
    touch app/visits.txt && \
    chown app app/visits.txt

COPY . .

CMD [ "python", "./app.py" ]
