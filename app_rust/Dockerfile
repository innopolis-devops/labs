# syntax = docker/dockerfile:1.2

FROM clux/muslrust:stable as build

COPY Cargo.toml Cargo.lock /volume/
COPY src /volume/src
RUN --mount=type=cache,target=/root/.cargo/registry --mount=type=cache,target=/volume/target \
    cargo b --release --target x86_64-unknown-linux-musl && \
    cp target/x86_64-unknown-linux-musl/release/time-rust-web-app app_rust

# Tags for distroless are pretty weird :/
# hadolint ignore=DL3006
FROM gcr.io/distroless/static:debug

WORKDIR /app
COPY --from=build /volume/app_rust ./app_rust
COPY ./Rocket.toml .

EXPOSE 8000

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f http://localhost:8000/ || exit 1
  
# This user is already included in the image (found through debug version)
USER nonroot

ENTRYPOINT [ "./app_rust" ]
