FROM python:3.9

RUN useradd -m --no-log-init dappa
USER dappa

WORKDIR /app/
RUN python3 -m venv /app/env
ENV PATH="/app/env/bin:$PATH"

RUN mkdir volume && \
    touch volume/visits.txt
COPY ./requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -r ./requirements.txt

COPY ./app.py ./

CMD ["flask", "run", "--host=0.0.0.0", "--port=4000"]

EXPOSE 4000