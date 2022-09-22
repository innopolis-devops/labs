# Terraform Infrastructure

<!-- Suppress linter warnings for HTML tags -->
<!-- markdownlint-disable MD033 -->

## Docker

### Initial setup

#### `terraform show` output

<details>
<summary>Click to show...</summary>

```terraform
# docker_container.python_app:
resource "docker_container" "python_app" {
    attach                                      = false
    command                                     = [
        "./.venv/bin/gunicorn",
        "--config",
        "./app/config/gunicorn.conf.py",
        "app.api:app",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "2c7d1f456f52"
    id                                          = "2c7d1f456f5232a60d412423b3e2a0bca13941de8fe92871aa08121ce080e5a7"
    image                                       = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
    init                                        = false
    ip_address                                  = "172.17.0.2"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "python_app"
    network_data                                = [
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
    network_mode                                = "default"
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "app"
    working_dir                                 = "/app"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.python_app:
resource "docker_image" "python_app" {
    id           = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349fntdesmond/iu-devops-python:latest"
    image_id     = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
    keep_locally = false
    latest       = "sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349f"
    name         = "ntdesmond/iu-devops-python:latest"
    repo_digest  = "ntdesmond/iu-devops-python@sha256:2473c63d1e737369473c3af1ea4b3ef1c20539553a946be3f0f957c087097885"
}
```

</details>

#### `terraform state list` output

<details>
<summary>Click to show...</summary>

```terraform
docker_container.python_app
docker_image.python_app
```

</details>

### Changes

The changes applied were:

- the container being renamed (not seen in `terraform plan` since the default value matched the one used previously)
- external port changed from `8000` to `8080`
- added outputs (see [`outputs.tf`](./docker/outputs.tf))

#### `terraform plan` output (changes preview)

##### Full output

<details>
<summary>Click to show...</summary>

```terraform
docker_image.python_app: Refreshing state... [id=sha256:7d49357c932cbd36064cc63284a083331535067fde1a919d999f1ac88f10349fntdesmond/iu-devops-python:latest]
docker_container.python_app: Refreshing state... [id=2c7d1f456f5232a60d412423b3e2a0bca13941de8fe92871aa08121ce080e5a7]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.python_app must be replaced
-/+ resource "docker_container" "python_app" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "./.venv/bin/gunicorn",
          - "--config",
          - "./app/config/gunicorn.conf.py",
          - "app.api:app",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      ~ gateway                                     = "172.17.0.1" -> (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "2c7d1f456f52" -> (known after apply)
      ~ id                                          = "2c7d1f456f5232a60d412423b3e2a0bca13941de8fe92871aa08121ce080e5a7" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "python_app"
      ~ network_data                                = [
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
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "app" -> null
      - working_dir                                 = "/app" -> null
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

      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.

```

</details>

##### The part that is controlled manually

<details>
<summary>Click to show...</summary>

```terraform
      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
```

</details>

#### `terraform output` output

<details>
<summary>Click to show...</summary>

```terraform
container_id = "94f215dbdb034aef3734438e10870177db4971c71e69559725ced8ad04e138fb"
image_name = "ntdesmond/iu-devops-python:latest"
ports = [
  "8080 -> 8000",
]
```

</details>
