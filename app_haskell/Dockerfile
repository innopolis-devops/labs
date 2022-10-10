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
    apt-get install -yqq curl=7.81.0 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

USER user

HEALTHCHECK --interval=30s --timeout=5s CMD ["curl", "http://127.0.0.1:8080"]

ENTRYPOINT [ "/app/moscow-time-app-exe" ]
