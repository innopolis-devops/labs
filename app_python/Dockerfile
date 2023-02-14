FROM python:3.8-slim-buster

RUN useradd -m --no-log-init pythonuser
USER pythonuser

WORKDIR /app/
RUN python3 -m venv /app/env
ENV PATH="/app/env/bin:$PATH"

COPY ./requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -r ./requirements.txt

COPY ./app.py ./

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

EXPOSE 5000
