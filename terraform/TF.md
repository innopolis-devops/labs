# Terraform

## Best practices
- Use env variables for hiding sensitive info\
- Use formatter for terraform files
- Put variables and outputs into separate files
- Use validate and plan for checking changes
## `terraform show` for docker moscow_time
```
$ terraform show
resource "docker_container" "moscow_time" {
bash: $: command not found
    attach                                      = false
    command                                     = [
        "python3",
        "-m",
        "flask",
        "--app",
        "moscow_time/main.py",
        "run",
        "--host=0.0.0.0",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "93ad5cec4927"
    id                                          = "93ad5cec49274c234a476b3d03057a88bd3b55f7829d9ac6e4bb2b5d4c2ee13c"
    image                                       = "sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7b"
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
    name                                        = "moscow_time_tutorial"
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
    working_dir                                 = "/app_python"

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.moscow_time:
resource "docker_image" "moscow_time" {
    id           = "sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7balexdestdev/moscow_time:latest"
    image_id     = "sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7b"
    keep_locally = false
    latest       = "sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7b"
    name         = "alexdestdev/moscow_time:latest"
    repo_digest  = "alexdestdev/moscow_time@sha256:8d52bcb4dfa7f815c299a8568dbc655583a534999f4bbd79f18fdff5ed65a3c7"
}
```

## `terraform state list` for docker moscow_time
```
$ terraform state list
docker_container.moscow_time
docker_image.moscow_time 
```
## changed port from 8000 to 8080. result of `terraform apply` for changes
~~~
$ terraform apply
docker_image.moscow_time: Refreshing state... [id=sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7balexdestdev/moscow_time:latest]
docker_container.moscow_time: Refreshing state... [id=93ad5cec49274c234a476b3d03057a88bd3b55f7829d9ac6e4bb2b5d4c2ee13c]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.moscow_time must be replaced
-/+ resource "docker_container" "moscow_time" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "moscow_time/main.py",
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
      ~ hostname                                    = "93ad5cec4927" -> (known after apply)
      ~ id                                          = "93ad5cec49274c234a476b3d03057a88bd3b55f7829d9ac6e4bb2b5d4c2ee13c" -> (known after apply)
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
        name                                        = "moscow_time_tutorial"
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
      - working_dir                                 = "/app_python" -> null
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

~~~

## Changed name of container to moscow_time_default through variables
~~~
docker_image.moscow_time: Refreshing state... [id=sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7balexdestdev/moscow_time:latest]
docker_container.moscow_time: Refreshing state... [id=e3e33b87e1065e45e7cea566e0bb79ecbd6478a8e336da687ec57574e1272cd4]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.moscow_time must be replaced
-/+ resource "docker_container" "moscow_time" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "moscow_time/main.py",
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
      ~ hostname                                    = "e3e33b87e106" -> (known after apply)
      ~ id                                          = "e3e33b87e1065e45e7cea566e0bb79ecbd6478a8e336da687ec57574e1272cd4" -> (known after apply)
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
      ~ name                                        = "moscow_time_tutorial" -> "moscow_time_default" # forces replacement
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
      - working_dir                                 = "/app_python" -> null
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

~~~
## added output. result of `terraform output`
~~~
$ terraform output
container_id = "d01b00c36fbacc3475f33b6755f93c9382942545dbd79b25fc207ca724748ce7"
image_id = "sha256:631fd8d4b7d9c9e2285ac3539bcb08ef6b67277fe8facf946f74f63e80126d7balexdestdev/moscow_time:latest"

~~~
