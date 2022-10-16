# Docker 
___
### Result of "terraform show"

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
    hostname          = "0e11c5c957a4"
    id                = "0e11c5c957a4563dc400658e74402ee2b6e9a7c02a7433fe05672a228d397d28"
    image             = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
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
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}

```

### Result of "terraform state list"

```
docker_container.nginx
docker_image.nginx
```

### Changes:

I changed the external port. Result of **terraform apply**:
```
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

Changes from **terraform show**:
```
ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
```


### Output of **terraform output**

```
container_id = "538202bd6c255ebaaee7b86adf1ba7710152c98f0b56e44b044aded737839572"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

# Yandex Cloud
___
Had a problem with CLI on mac, f.e.:
```
LibreSSL SSL_read: error:02FFF036:system library:func(4095):Connection reset by peer, errno 54
-bash: yc: command not found
```
kept seeing these problems, even if I have been
following guides from documentation step-by-step

# Best Practices
___
1. Follow a standard module structure. Start every module with a main.tf file, where resources are located by default.
2. Create logical groupings of resources with their own files and descriptive names, such as network.tf, instances.tf, or loadbalancer.tf.
3. Name all configuration objects using underscores to delimit multiple words. This practice ensures consistency with the naming convention for resource types, data source types, and other predefined values.
4. Declare all variables in variables.tf.
5. Give variables descriptive names that are relevant to their usage or purpose.
6. Organize all outputs in an outputs.tf file.
7. Limit the use of custom scripts
8. Limit the complexity of expressions
9. Pin to minor provider versions. In root modules, declare each provider and pin to a minor version. This allows automatic upgrade to new patch releases while still keeping a solid target.
