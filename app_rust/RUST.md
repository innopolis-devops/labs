# Innopolis DevOps labs (Rust implementation)

## Best practices for Rust web development

+ for simple web application, use simple web framework - **Rocket**
+ use docker for your application for easy production run
+ use cargo fmt for formatting your code
+ in prod mode, build with `--release` flag
+ use Jinja2 templates instead of hardcoding html

## Build

1. Native run for development. You need to install `rust` tools

```bash
cargo run
```

2. Production run in docker

```bash
cd app_rust
docker build . -t currenttime-rust
docker run --rm -p 4444:4444 currenttime-rust
```

## Test & lint check

```bash
cargo test
cargo fmt --all -- --check --config imports_granularity=Crate
cargo clippy --all --all-features -- -D warnings
```

## Usage

```bash
curl localhost:4444
```
