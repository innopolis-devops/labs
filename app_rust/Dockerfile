# syntax = docker/dockerfile:1.2

FROM clux/muslrust:stable as build

COPY . /volume
RUN --mount=type=cache,target=/root/.cargo/registry --mount=type=cache,target=/volume/target \
    cargo b --target x86_64-unknown-linux-musl && \
    cp target/x86_64-unknown-linux-musl/release/app_rust app_rust

FROM gcr.io/distroless/static

EXPOSE 8000

WORKDIR /app
COPY --from=build /volume/app_rust ./app_rust
COPY ./Rocket.toml .

ENTRYPOINT [ "./app_rust" ]
