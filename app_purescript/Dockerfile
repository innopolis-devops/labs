FROM buildpack-deps:bionic

RUN set -ex; \
    useradd --create-home codewarrior; \
    mkdir -p /workspace; \
    chown -R codewarrior: /workspace;

RUN set -ex; \
    curl -sL https://deb.nodesource.com/setup_16.x | bash -; \
    apt-get install -y nodejs; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*;

RUN npm install -g purescript@0.15.4;
RUN npm install -g spago@0.20.9;
RUN npm install -g parcel@2.5.0;

COPY ./package.json ./spago.dhall ./packages.dhall /workspace/

WORKDIR /workspace

# install packages
RUN npm install;

# compile packages
RUN spago install;

USER codewarrior

ENV USER=codewarrior \
    HOME=/home/codewarrior \
    PATH=/opt/purescript:$PATH

COPY --chown=codewarrior:codewarrior ./ /workspace

RUN spago build;

RUN set -ex;

RUN parcel serve -p 8003 --host 0.0.0.0 dev/index.html;
# ensure testing works
# spago test || true; \
# clean up
# rm -rf ./src/ ./output/ ./test/ ;