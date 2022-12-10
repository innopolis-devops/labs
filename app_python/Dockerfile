FROM python:3.8-slim-buster
WORKDIR /app_python
COPY package.txt package.txt
RUN pip install --no-cache-dir -r package.txt
COPY . .
CMD [ "python3", "-m" , "flask", "--app", "app.py", "run", "--host=0.0.0.0"]
EXPOSE 8080/tcp

