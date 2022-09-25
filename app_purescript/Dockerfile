FROM buildpack-deps:bionic

RUN set -ex; \
    useradd --create-home codewarrior; \
    mkdir -p /app; \
    chown -R codewarrior: /app;

RUN set -ex; \
    curl -sL https://deb.nodesource.com/setup_16.x | bash -; \
    apt-get install -y nodejs; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*;

RUN npm install -g purescript@0.15.4;
RUN npm install -g spago@0.20.9;
RUN npm install -g parcel@2.5.0;

COPY ./package.json ./spago.dhall ./packages.dhall /app/

WORKDIR /app

USER codewarrior

ENV USER=codewarrior \
    HOME=/home/codewarrior \
    PATH=/opt/purescript:$PATH

RUN chown codewarrior:codewarrior /app;

# install packages
RUN npm install;

# compile packages
RUN spago install;

COPY --chown=codewarrior:codewarrior ./ /app

RUN spago build;

RUN set -ex;

ARG PORT
ARG HOST

EXPOSE $PORT

CMD parcel serve -p ${PORT} --host ${HOST} dev/index.html

# ensure testing works
# spago test || true; \
# clean up
# rm -rf ./src/ ./output/ ./test/ ;