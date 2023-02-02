## terraform show
```
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "app.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "python",
    ]
    env                                         = []
    hostname                                    = "6bd28ae4a30d"
    id                                          = "6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744"
    image                                       = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "moscow_time"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.3"
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
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app_python"

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0tiny0wizard/app_python:latest"
    image_id     = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0"
    keep_locally = false
    name         = "tiny0wizard/app_python:latest"
    repo_digest  = "tiny0wizard/app_python@sha256:69ba1184cbf30644c93dbc449079b40757568aad0bdc97bf512bce82a95c642f"
}


Outputs:

container_id = "6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744"
image_id = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0tiny0wizard/app_python:latest"
`

## terraform state list

`
docker_container.app_python
docker_image.app_python
```

# Infrastructure Change

```
docker_image.app_python: Refreshing state... [id=sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0tiny0wizard/app_python:latest]
docker_container.app_python: Refreshing state... [id=6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.app_python must be replaced
-/+ resource "docker_container" "app_python" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "app.py",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "python",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "6bd28ae4a30d" -> (known after apply)
      ~ id                                          = "6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744" -> (known after apply)
      ~ image                                       = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0" -> "tiny0wizard/app_python:latest" # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "moscow_time" -> "moscow_time_app" # forces replacement
      ~ network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
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
      - working_dir                                 = "/app_python" -> null
        # (13 unchanged attributes hidden)

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
  ~ container_id = "6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744" -> (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.app_python: Destroying... [id=6bd28ae4a30d9082527704933c8903d84892a79de278ce8c1329b9c074e42744]
docker_container.app_python: Destruction complete after 0s
docker_container.app_python: Creating...
docker_container.app_python: Creation complete after 1s [id=d8b0677a9f7f36e04d48f3986538fa2b925fb53b3b6d9f8d76f06e88f08819b0]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

container_id = "d8b0677a9f7f36e04d48f3986538fa2b925fb53b3b6d9f8d76f06e88f08819b0"
image_id = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0tiny0wizard/app_python:latest"
```

## terraform output
```
PS E:\Projects\Temp\terraform\docker> terraform output
container_id = "d8b0677a9f7f36e04d48f3986538fa2b925fb53b3b6d9f8d76f06e88f08819b0"
image_id = "sha256:baff6d59d580e2150d02b38c4ae98a89f84c971af648d377fcf875a0ab8607a0tiny0wizard/app_python:latest"
```
