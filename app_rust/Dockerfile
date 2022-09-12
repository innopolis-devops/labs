FROM rustlang/rust:nightly

ENV ROCKET_ADDRESS=0.0.0.0

WORKDIR /app
EXPOSE 8000

# Restricting running as root
RUN adduser --disabled-password protected_user && chown -R protected_user /app
USER protected_user

# Copying the necessary dependencies
COPY Cargo.lock .
COPY Cargo.toml .

# Copying the necessary project sources
COPY Makefile .
COPY /src src
