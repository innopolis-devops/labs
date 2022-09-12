FROM python:3.11-rc-slim

ENV APP_USER=app \
    APP_DIR=/usr/src/app_python
WORKDIR $APP_DIR

RUN useradd $APP_USER; chown $APP_USER $APP_DIR
USER $APP_USER

COPY requirements.txt ./

RUN python -m venv ./env
ENV PATH="$APP_DIR/env/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "gunicorn", "--bind=0.0.0.0", "app:app" ]