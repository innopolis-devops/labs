FROM python:3.8.1

RUN pip install Flask --no-cache-dir 
RUN pip install pytz --no-cache-dir 

WORKDIR /app

EXPOSE 5000

COPY . . 

RUN pip install -r requirements.txt --no-cache-dir 

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]