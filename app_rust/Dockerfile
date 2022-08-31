FROM rust:1.63-bullseye as build-container

WORKDIR /build

COPY . .
RUN cargo build --release
RUN ls ./target/release/
RUN mv ./target/release/rustapp /app
RUN rm -rf .

FROM debian:bullseye-slim

WORKDIR app
COPY --from=build-container /app/rustapp ./

ENTRYPOINT [ "ROCKET_ENV=production", "./app/rustapp" ]
