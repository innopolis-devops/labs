FROM python:3.10.4-alpine as base

WORKDIR /usr/src/app/app_python

RUN apk add --update build-base=0.5-r3

RUN pip install --upgrade pip
RUN pip freeze > requirements.txt
RUN echo "Django==3.2.6" > requirements.txt
RUN echo "gunicorn==20.1.0" > requirements.txt
RUN pip install -r requirements.txt

# Multistage build
FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1



COPY --from=base /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=base /usr/local/bin/ /usr/local/bin/

COPY --chown=app_user:app_user . .

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]