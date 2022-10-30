# syntax=docker/dockerfile:1.3-labs
FROM buildpack-deps:bionic

SHELL ["/bin/bash", "-c"]

RUN <<EOF 
set -ex -o pipefail;
useradd --create-home codewarrior;
mkdir -p /app;
chown -R codewarrior: /app;
curl -sL https://deb.nodesource.com/setup_16.x | bash -;
apt-get install --no-install-recommends -y nodejs;
apt-get clean;
rm -rf /var/lib/apt/lists/* /tmp/*;
npm install -g purescript@0.15.4 spago@0.20.9 parcel@2.5.0
EOF

COPY package.json spago.dhall packages.dhall /app/

WORKDIR /app

USER codewarrior

ENV USER=codewarrior \
    HOME=/home/codewarrior \
    PATH=/opt/purescript:$PATH

RUN chown codewarrior:codewarrior /app; \
    npm install; \
    spago install;

RUN spago build;

COPY --chown=codewarrior:codewarrior src /app/src

RUN spago build

COPY --chown=codewarrior:codewarrior dev /app/dev

EXPOSE $PORT

ENTRYPOINT ["bash", "-c", "parcel serve -p $PORT --host $HOST dev/index.html"]

# ensure testing works
# spago test || true; \
# clean up
# rm -rf ./src/ ./output/ ./test/ ;