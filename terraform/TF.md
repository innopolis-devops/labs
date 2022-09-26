# Terraform
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
