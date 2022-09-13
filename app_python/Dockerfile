FROM python:3.10.4-alpine as base

WORKDIR /usr/src/app/app_python

RUN apk add --update build-base=0.5-r3

RUN pip install --upgrade pip

#RUN pip install -r requirements.txt

# Multistage build
FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


RUN adduser -D app_user && chown -R app_user /usr/src/app
USER app_user:app_user

COPY --from=base /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=base /usr/local/bin/ /usr/local/bin/

COPY --chown=app_user:app_user . .

RUN python manage.py flush --no-input
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]