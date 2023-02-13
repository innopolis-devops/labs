## Result of terraform show:
___

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
    hostname          = "baab0bba9432"
    id                = "baab0bba943249e0d305335ad90c4580e019e38a3770e0b4ec0b4e77202c2293"
    image             = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
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
    id           = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94nginx:latest"
    keep_locally = false
    latest       = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:6650513efd1d27c1f8a5351cbd33edf85cc7e0d9d0fcb4ffb23d8fa89b601ba8"
}

```

## Result of terraform state list:
___
```
docker_container.nginx
docker_image.nginx
```

## Changes:
___

```
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
### Applied changes:
```
ports {
        external = 80
        internal = 8080
```

## Ouput value:
```
nurbakzh-osx:terraform nurbakzh$ terraform output
container_id = "41885fee4efd45dc6bf7bb77061debd1af0ebc0e95e8f144f0a6629ca035d0a3"
image_id = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94nginx:latest"
```

## AWS / Yandex Cloud:
___
My trial subscription is ended, so I decided to make a bonus task instead of this part

## Best Practices:
___
1. Follow a standard module structure. Start every module with a main.tf file, where resources are located by default.
2. Name all configuration objects using underscores to delimit multiple words(**f.e. github_branch_default**). This practice ensures consistency with the naming convention for resource types, data source types, and other predefined values.
3. Create logical groupings of resources with their own files and descriptive names, such as network.tf, instances.tf, or loadbalancer.tf.
4. Declare all variables in variables.tf.
5. Give variables descriptive names that are relevant to their usage or purpose.
6. Organize all outputs in an outputs.tf file.
7. Limit the complexity of expressions