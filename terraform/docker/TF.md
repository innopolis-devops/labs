# Terraform

## `terraform show`
```
erik@DESKTOP-I8RUIBG terraform % terraform show
# docker_container.devops:
resource "docker_container" "devops" {
    attach                                      = false
    command                                     = [
        "python3",
        "-m",
        "flask",
        "--app",
        "app.py",
        "run",
        "--host=0.0.0.0",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "02d4ebf4dfbe"
    id                                          = "02d4ebf4dfbe15895e455e49e9a07945e1efff8c395f40c2688f8ea686e47019"
    image                                       = "sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57ea"
    init                                        = false
    ip_address                                  = "172.17.0.3"
    ip_prefix_length                            = 16
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "tutorial"
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

# docker_image.devops:
resource "docker_image" "devops" {
    id           = "sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57eanecesanov/devops:latest"
    image_id     = "sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57ea"
    keep_locally = false
    latest       = "sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57ea"
    name         = "necesanov/devops:latest"
}

```

## `terraform state list` for docker devops
```
erik@DESKTOP-I8RUIBG terraform % terraform state list
docker_container.devops
docker_image.devops

```
## Changes
~~~
erik@DESKTOP-I8RUIBG terraform % terraform apply
docker_image.devops: Refreshing state... [id=sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57eanecesanov/devops:latest]
docker_container.devops: Refreshing state... [id=02d4ebf4dfbe15895e455e49e9a07945e1efff8c395f40c2688f8ea686e47019]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.devops must be replaced
-/+ resource "docker_container" "devops" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "app.py",
          - "run",
          - "--host=0.0.0.0",
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
      ~ hostname                                    = "02d4ebf4dfbe" -> (known after apply)
      ~ id                                          = "02d4ebf4dfbe15895e455e49e9a07945e1efff8c395f40c2688f8ea686e47019" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.3" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "tutorial"
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
        # (14 unchanged attributes hidden)

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


~~~

## Changed name of container through variables
~~~
erik@DESKTOP-I8RUIBG terraform % terraform apply
docker_image.devops: Refreshing state... [id=sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57eanecesanov/devops:latest]
docker_container.devops: Refreshing state... [id=764d12189c53e271e5c6f114bbfa44b09953b017191443aa2883799f63014e8b]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.devops must be replaced
-/+ resource "docker_container" "devops" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "app.py",
          - "run",
          - "--host=0.0.0.0",
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
      ~ hostname                                    = "764d12189c53" -> (known after apply)
      ~ id                                          = "764d12189c53e271e5c6f114bbfa44b09953b017191443aa2883799f63014e8b" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ip_address                                  = "172.17.0.3" -> (known after apply)
      ~ ip_prefix_length                            = 16 -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      - links                                       = [] -> null
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "tutorial" -> "devops" # forces replacement
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
        # (14 unchanged attributes hidden)

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


~~~
## `terraform output`
~~~
Outputs:

container_id = "f76c4bfe41ab4a3cd7e0c643b52d65e033dc879cd816c122263c01562ccca010"
image_id = "sha256:69a656652bef13a03ae844763b7b8b96f12c72441fceaa9d96806847a64e57eanecesanov/devops:latest"

~~~