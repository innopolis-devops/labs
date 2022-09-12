FROM python:3.8.1

RUN pip install Flask
RUN pip install pytz

WORKDIR /app
COPY . . 

RUN pip install -r requirements.txt

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]