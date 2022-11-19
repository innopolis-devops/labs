FROM python:3.10-slim

ENV APP=/home/app
ENV VENV_PATH=$APP/venv
ENV PATH="$VENV_PATH/bin:$PATH"

RUN python3 -m venv $VENV_PATH && \
    useradd app -s /bin/sh -d $APP && \
    mkdir $APP/persistent &&  \
    touch $APP/persistent/visits.json && \
    chown app:app $APP/persistent/visits.json

WORKDIR $APP

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

USER app

EXPOSE 8000
COPY --chown=app:app msctime/ ./msctime/

ENTRYPOINT ["gunicorn", "msctime.app:app"]
CMD ["--bind", "0.0.0.0:8000", "--reload"]
