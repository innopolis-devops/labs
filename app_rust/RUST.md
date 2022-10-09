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

## Metrics

Default prometheus metrics. Example:

```console
> curl localhost:4444/metrics
# HELP rocket_http_requests_duration_seconds HTTP request duration in seconds for all requests
# TYPE rocket_http_requests_duration_seconds histogram
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.005"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.01"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.025"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.05"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.25"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="0.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="2.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="10"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/",method="GET",status="200",le="+Inf"} 1
rocket_http_requests_duration_seconds_sum{endpoint="/",method="GET",status="200"} 0.000925208
rocket_http_requests_duration_seconds_count{endpoint="/",method="GET",status="200"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.005"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.01"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.025"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.05"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.25"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="0.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="1"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="2.5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="5"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="10"} 1
rocket_http_requests_duration_seconds_bucket{endpoint="/health",method="GET",status="200",le="+Inf"} 1
rocket_http_requests_duration_seconds_sum{endpoint="/health",method="GET",status="200"} 0.000241833
rocket_http_requests_duration_seconds_count{endpoint="/health",method="GET",status="200"} 1
# HELP rocket_http_requests_total Total number of HTTP requests
# TYPE rocket_http_requests_total counter
rocket_http_requests_total{endpoint="/",method="GET",status="200"} 1
rocket_http_requests_total{endpoint="/health",method="GET",status="200"} 1
```
