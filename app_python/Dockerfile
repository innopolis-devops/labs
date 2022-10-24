FROM python:3.10.4-alpine as base

RUN apk add --update build-base=0.5-r3

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt  --no-cache-dir

# Multistage build
FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

RUN adduser -D app_user && chown -R app_user /usr/src/app
USER app_user:app_user

COPY --from=base /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=base /usr/local/bin/ /usr/local/bin/

COPY --chown=app_user:app_user . .

RUN python manage.py flush --no-input
RUN python manage.py migrate

HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD wget --no-verbose --tries=3 --spider 127.0.0.1:8000/healthcheck || exit 1

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
