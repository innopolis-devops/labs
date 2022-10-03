# Terraform

## Docker

`terraform show` output:

```terraform
# docker_container.timeweb:
resource "docker_container" "timeweb" {
    attach            = false
    command           = [
        "gunicorn",
        "--workers",
        "5",
        "--bind",
        "0.0.0.0:50000",
        "wsgi:app",
    ]
    cpu_shares        = 0
    entrypoint        = []
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "77fe0063ca1d"
    id                = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3"
    image             = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823"
    init              = false
    ip_address        = "172.17.0.2"
    ip_prefix_length  = 16
    ipc_mode          = "private"
    log_driver        = "json-file"
    logs              = false
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    must_run          = true
    name              = "timeweb"
    network_data      = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            network_name              = "bridge"
        },
    ]
    network_mode      = "default"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    remove_volumes    = true
    restart           = "no"
    rm                = false
    security_opts     = []
    shm_size          = 64
    start             = true
    stdin_open        = false
    tty               = false
    user              = "python"
    working_dir       = "/app"

    ports {
        external = 50000
        internal = 50000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.timeweb:
resource "docker_image" "timeweb" {
    id           = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823passkeyra/timeweb:latest"
    keep_locally = false
    latest       = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823"
    name         = "passkeyra/timeweb:latest"
    repo_digest  = "passkeyra/timeweb@sha256:949f3840f6dce472b52ebdfc9b6dd6179e64831226f0177c4d0ca4dfcd57163c"
}


Outputs:

timeweb_container_id = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3"
timeweb_ports = 50000
```

`terraform state list`:

```
docker_container.timeweb
docker_image.timeweb
```

After changing container name:

```terraform
# docker_container.timeweb must be replaced
-/+ resource "docker_container" "timeweb" {
      + bridge            = (known after apply)
      ~ command           = [
          - "gunicorn",
          - "--workers",
          - "5",
          - "--bind",
          - "0.0.0.0:50000",
          - "wsgi:app",
        ] -> (known after apply)
      + container_logs    = (known after apply)
      - cpu_shares        = 0 -> null
      - dns               = [] -> null
      - dns_opts          = [] -> null
      - dns_search        = [] -> null
      ~ entrypoint        = [] -> (known after apply)
      ~ env               = [] -> (known after apply)
      + exit_code         = (known after apply)
      ~ gateway           = "172.17.0.1" -> (known after apply)
      - group_add         = [] -> null
      ~ hostname          = "77fe0063ca1d" -> (known after apply)
      ~ id                = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
      ~ name              = "timeweb" -> "timeweb-container" # forces replacement
      ~ network_data      = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode      = "default" -> null
      - privileged        = false -> null
      - publish_all_ports = false -> null
      ~ security_opts     = [] -> (known after apply)
      ~ shm_size          = 64 -> (known after apply)
      - sysctls           = {} -> null
      - tmpfs             = {} -> null
      - user              = "python" -> null
      - working_dir       = "/app" -> null
        # (12 unchanged attributes hidden)

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ timeweb_container_id = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3" -> (known after apply)
```
