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

USER user

ENTRYPOINT [ "/app/moscow-time-app-exe" ]
