# syntax = docker/dockerfile:1.2

FROM clux/muslrust:stable as build

COPY . /volume
RUN --mount=type=cache,target=/root/.cargo/registry --mount=type=cache,target=/volume/target \
    cargo b --release --target x86_64-unknown-linux-musl && \
    cp target/x86_64-unknown-linux-musl/release/rustapp rustapp

FROM gcr.io/distroless/static

EXPOSE 8080

COPY --from=build /volume/rustapp /app/rustapp

ENTRYPOINT [ "ROCKET_ENV=production", "./app/rustapp" ]
