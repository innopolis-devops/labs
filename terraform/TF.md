# Output of commands

`terraform show`:

```
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach            = false
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "7b1900f4b33c"
    id                = "7b1900f4b33cee3dab79e096ecdef829dcf86a4165b2c7595afd01df71224b82"
    image             = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
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
    name              = "tutorial"
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

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

`terraform state list`:

```
docker_container.nginx
docker_image.nginx
```

## Changes in the infrastructure

Changed the external port to 4044:

```
ports {
    ~ external = 8080 -> 4044 # forces replacement
    # (3 unchanged attributes hidden)
}
```

## Output of `terraform output`

```
container_id = "083ff0082f1db75118ed7c6e743016a3a5b127b9ff02edd99811c56b2fec214f"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
```