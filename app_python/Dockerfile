FROM python:3.9.14-alpine3.16

ENV PORT 8000

WORKDIR /app

COPY . .

EXPOSE $PORT

RUN pip3 install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
