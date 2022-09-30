# Terraform

## Best practices

- Exclude temporary and unneccessary files with *.gitignore*.
- To format files, perform `terraform fmt` in the terminal.
- Better to use *outputs.tf* to define the outputs.
- Better to use *variables.tf* to define the variables.

## Docker

### Initial structure

After calling `terraform show` at the first time, we will see

```commandline
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "gunicorn",
        "--bind",
        "0.0.0.0:8080",
        "tttime.app:app",
        "--reload",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "785b13fa754e"
    id                                          = "785b13fa754ec5cfabf18ea6f494d75d1311f23343ed99394fa8990d0a98f317"
    image                                       = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
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
    name                                        = "Meow"
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
    working_dir                                 = "/app"

    ports {
        external = 5050
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00whutao/app_python:latest"
    image_id     = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
    keep_locally = false
    latest       = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
    name         = "whutao/app_python:latest"
    repo_digest  = "whutao/app_python@sha256:1006ceeab0020c09ae73072999627509a8040e6c2e111b3f7f118d2e7a13f980"
}
```

After calling `terraform state list` at the first time, we will see

```commandline
docker_container.app_python
docker_image.app_python
```

### After infrastructure building

We introduce outputs defined in `outputs.tf` and variable for the container name defined in `variables.tf`.
Then, after applying the changes and showing the state, we will see

```commandline
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "gunicorn",
        "--bind",
        "0.0.0.0:8080",
        "tttime.app:app",
        "--reload",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "08330d55e07f"
    id                                          = "08330d55e07f14f5f1fca84d79a991355ba3c4c03f4b483f70e6906449a42085"
    image                                       = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
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
    name                                        = "python_web_application"
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
    working_dir                                 = "/app"

    ports {
        external = 5050
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00whutao/app_python:latest"
    image_id     = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
    keep_locally = false
    latest       = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00"
    name         = "whutao/app_python:latest"
    repo_digest  = "whutao/app_python@sha256:1006ceeab0020c09ae73072999627509a8040e6c2e111b3f7f118d2e7a13f980"
}


Outputs:

docker_container_id = "08330d55e07f14f5f1fca84d79a991355ba3c4c03f4b483f70e6906449a42085"
docker_image_id = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00whutao/app_python:latest"
```

Finally, the command `terraform output` will give us

```commandline
whutao@Romans-MacBook-Pro docker % terraform output
docker_container_id = "08330d55e07f14f5f1fca84d79a991355ba3c4c03f4b483f70e6906449a42085"
docker_image_id = "sha256:217f99b91b69f465e373d644e6eb4cf34e30efdf2676d6d1592a2b890460de00whutao/app_python:latest"
```
