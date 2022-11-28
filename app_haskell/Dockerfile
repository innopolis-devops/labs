# build
FROM haskell:8.10.7-slim as build

COPY . /app

WORKDIR /app

RUN stack --local-bin-path=target --system-ghc install

# main
FROM ubuntu:22.04 as main

RUN useradd --create-home user

WORKDIR /app

COPY --from=build /app/target/moscow-time-app-exe .

# owned by root, non-writable to others, others only can execute
RUN chmod 001 /app/moscow-time-app-exe

RUN apt-get update && \
    apt-get install -yqq --no-install-recommends curl=7.81.0-1ubuntu1.6 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app/data && \
    touch data/visits.txt && \
    chown user data/visits.txt

VOLUME /app/data

USER user

HEALTHCHECK --interval=30s --timeout=5s CMD ["curl", "http://127.0.0.1:8080"]

ENTRYPOINT [ "/app/moscow-time-app-exe" ]
