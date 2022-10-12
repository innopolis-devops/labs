FROM python:3.10-slim

WORKDIR /app

RUN ["adduser", "--system", "--group", "moscower"]

ENV USERNAME moscower
USER ${USERNAME}

ENV PATH /home/${USERNAME}/.local/bin:${PATH}

COPY ./requirements.txt /app/requirements.txt
RUN ["pip", "install", "--no-cache-dir", "--upgrade", "-r", "/app/requirements.txt"]

COPY ./app /app/app
COPY ./templates /app/templates

HEALTHCHECK --interval=1m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
