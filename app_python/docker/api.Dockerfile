FROM python:3.10-slim

# Locale.
RUN apt-get update -y && apt-get install -y locales alien \
    && localedef -i en_US -c -f UTF-8 -A \/usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Environment.
COPY ./requirements.txt /tmp
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir --root-user-action ignore -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Actually, we do not need root.
RUN groupadd devops && useradd devops -g devops

# App.
WORKDIR /app

# Logs and unix socket.
RUN mkdir ./logs && chown devops:devops logs && mkdir -p /tmp/app && chown devops:devops /tmp/app && \
    mkdir storage && touch ./storage/visits.log && chown -R devops:devops storage

# Source.
COPY ./src ./src

# Run.
USER devops
