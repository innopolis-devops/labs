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


FROM busybox AS wget

ARG BUSYBOX_VERSION=1.31.0-i686-uclibc
ADD https://busybox.net/downloads/binaries/$BUSYBOX_VERSION/busybox_WGET /wget
RUN chmod a+x /wget


# https://github.com/GoogleContainerTools/distroless/blob/main/examples/rust/Dockerfile
FROM gcr.io/distroless/cc
COPY --from=wget /wget /usr/bin/wget

HEALTHCHECK --interval=1m --timeout=3s \
  CMD wget --no-verbose --tries=3 --spider http://localhost:4444/health || exit 1

USER nonroot

COPY --from=build /build_app/target/release/currenttime /
COPY templates ./templates
COPY Rocket.toml ./Rocket.toml

CMD ["./currenttime"]
