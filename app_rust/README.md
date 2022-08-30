Innopolis DevOps labs (Rust implementation)
===


# Build & run

1. Native run for development. You need to install `rust` tools
```bash
$ cargo run
```

2. Production run in docker

```
$ cd app_rust
$ docker build . -t currenttime-rust
$ docker run --rm -p 4444:4444 currenttime-rust
```

# Usage

```bash
$ curl localhost:4444
```

