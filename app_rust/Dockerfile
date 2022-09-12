FROM rust:1.63 as build

WORKDIR /build_app

# cache dependencies
RUN cargo init
COPY ./Cargo.toml ./
RUN cargo build --release \
    && rm -rf ./src

# build
COPY ./ ./
RUN cargo build --release

# https://github.com/GoogleContainerTools/distroless/blob/main/examples/rust/Dockerfile
FROM gcr.io/distroless/cc
USER nonroot

COPY --from=build /build_app/target/release/currenttime /
COPY templates ./templates
COPY Rocket.toml ./Rocket.toml

CMD ["./currenttime"]
