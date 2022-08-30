FROM rust:1.63 as build

WORKDIR /build_app

# cache dependencies
RUN cargo init
COPY ./Cargo.toml ./
RUN cargo build --release
RUN rm -rf ./src

# build
COPY ./ ./
RUN cargo build --release

FROM ubuntu:20.04 as run

RUN apt-get update && apt-get install -y libssl1.1 libssl-dev ca-certificates

WORKDIR /app
COPY --from=build /build_app/target/release/currenttime /app/currenttime
COPY templates ./templates
COPY Rocket.toml ./Rocket.toml
EXPOSE 4444
ENTRYPOINT ["/app/currenttime"]
