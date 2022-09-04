FROM rustlang/rust:nightly

WORKDIR /app

COPY Cargo.lock .
COPY Cargo.toml .

COPY /src .

ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
