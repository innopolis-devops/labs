# Terraform

## Best practices

* credentials are hidden in env variables
* input variables are used in order to avoid hard-coded values in **main.tf**
* Config formatted by commands `terraform fmt` and `terraform validate`
* **outputs.tf** used for better organisation

## Lab tasks

### output for `terraform show`

```
user@MacBook-Pro-user docker % terraform show
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
    hostname          = "aca85332ae46"
    id                = "aca85332ae4697c0613e0169340c6dc4cff8f0019b7b714311cf857be49cfa25"
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
    name              = "ExampleNginxContainer"
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

### output for `terraform state list`

```
user@MacBook-Pro-user docker % terraform state list
docker_container.nginx
docker_image.nginx
```

### Changing port from 8080 to 8000

```
 ~ ports {
          ~ external = 8080 -> 8000 # forces replacement
            # (3 unchanged attributes hidden)
        }
```

### Changing name from **ExampleNginxContainer** to **ChangedName**

```
 ~ name              = "ExampleNginxContainer" -> "ChangedName" # forces replacement
```

### Addition of **outputs.tf**

```
Outputs:

container_id = "1fd5c096356f3202c4121d77f4de8b541f7bc03fcae4eb94f34c017b1a27bc36"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"

```