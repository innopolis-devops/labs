FROM python:3.10

WORKDIR /app

RUN adduser user

COPY ./ ./

VOLUME [ "./volume" ]

RUN pip install -r requirements.txt && flake8 ./app && python -m pytest

RUN chown -R user /app

USER user

CMD [ "python", "-m", "app" ]