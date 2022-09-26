# Terraform

## Terraform best practices

1. Use separate directory for each application
2. Organize outputs in an `outputs.tf`
3. Declare variables in `variables.tf`
4. Meaningful descriptions for variables and outputs
5. Use builtin formatter - `terraform fmt`
6. Validate terraform by `terraform validate`

## Docker

### `terraform show` for Docker

```
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "c5a96a72b26a"
    id                                          = "c5a96a72b26aada5503ba982636a68cb23cbffbcc9854ace685d41e705b6991b"
    image                                       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
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
    name                                        = "ExampleNginxContainer"
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
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    image_id     = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}


Outputs:

container_id = "c5a96a72b26aada5503ba982636a68cb23cbffbcc9854ace685d41e705b6991b"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

### `terraform state list` for Docker

    docker_container.nginx
    docker_image.nginx

### `terraform apply` for Docker

    ...
          ~ ports {
              ~ external = 8000 -> 8080 # forces replacement
                # (3 unchanged attributes hidden)
            }
    ...
    Plan: 1 to add, 0 to change, 1 to destroy.
    ...

### `terraform show` for Docker after changing port

    # docker_container.nginx

    resource "docker_container" "nginx" {
        ...
        ports {
            external = 8080
            internal = 80
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }
    ...

## Yandex Cloud

### `terraform show` for Yandex Cloud after all changes applied

```
# yandex_compute_instance.app-server:
resource "yandex_compute_instance" "app-server" {
    allow_stopping_for_update = true
    created_at                = "2022-09-26T19:04:26Z"
    folder_id                 = "b1g50dckd939ogdg1crc"
    fqdn                      = "fhmk69n882sbva8qj9qs.auto.internal"
    id                        = "fhmk69n882sbva8qj9qs"
    metadata                  = {
        "ssh-keys" = "keys.pub"
    }
    name                      = "app-server"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmikeq3g0hvjnvdntcj"
        disk_id     = "fhmikeq3g0hvjnvdntcj"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8c00efhiopj3rlnlbn"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.1.6"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:14:32:6e:84"
        nat                = true
        nat_ip_address     = "84.201.130.183"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bbs6bv607me1993psb"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.net-1:
resource "yandex_vpc_network" "net-1" {
    created_at = "2022-09-26T19:04:24Z"
    folder_id  = "b1g50dckd939ogdg1crc"
    id         = "enp1e0oa2robdr55f77s"
    labels     = {}
    name       = "net1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T19:04:25Z"
    folder_id      = "b1g50dckd939ogdg1crc"
    id             = "e9bbs6bv607me1993psb"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp1e0oa2robdr55f77s"
    v4_cidr_blocks = [
        "192.168.1.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "84.201.130.183"
internal_ip_address_vm_1 = "192.168.1.6"

```

### `terraform state list` for Yandex Cloud

    yandex_compute_instance.app-server
    yandex_vpc_network.net-1
    yandex_vpc_subnet.subnet-1
