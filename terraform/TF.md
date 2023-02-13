# Docker
## Initial state
```
terraform show

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
    hostname                                    = "a2acfabf1dc6"
    id                                          = "a2acfabf1dc67996715825abdf39e52e0ec73d843b3e27f2073f4e85f995ab1e"
    image                                       = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "nginx"
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
    wait                                        = false
    wait_timeout                                = 60

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
    image_id     = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
    keep_locally = false
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:6650513efd1d27c1f8a5351cbd33edf85cc7e0d9d0fcb4ffb23d8fa89b601ba8"
}
```

```
terraform state list

docker_container.nginx
docker_image.nginx
```

## Applying changes
```
Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "a2acfabf1dc6" -> (known after apply)
      ~ id                                          = "a2acfabf1dc67996715825abdf39e52e0ec73d843b3e27f2073f4e85f995ab1e" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "nginx"
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
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
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

Plan: 1 to add, 0 to change, 1 to destroy.
```

Output
```
container_id = "a570d7f0e74ad032e99cf1b4f824e4d0de89ec788edc3d6d3db7b032a89f6094"
image_id = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94nginx:latest"
```

# Yandex Cloud

## Initial state

```
terraform show 
# data.yandex_compute_image.default:
data "yandex_compute_image" "default" {
    created_at    = "2023-01-30T10:49:08Z"
    description   = "ubuntu 22.04 lts"
    family        = "ubuntu-2204-lts"
    folder_id     = "standard-images"
    id            = "fd8emvfmfoaordspe1jr"
    image_id      = "fd8emvfmfoaordspe1jr"
    labels        = {}
    min_disk_size = 5
    name          = "ubuntu-22-04-lts-v20230130"
    os_type       = "linux"
    pooled        = true
    product_ids   = [
        "f2eokm18lqng83m1koki",
    ]
    size          = 4
    status        = "ready"
}

# yandex_compute_instance.default:
resource "yandex_compute_instance" "default" {
    created_at                = "2023-02-11T18:57:25Z"
    folder_id                 = "b1gb6dqdqpvg2u2f1hj3"
    fqdn                      = "yandex-terraform.ru-central1.internal"
    hostname                  = "yandex-terraform"
    id                        = "epdj1t21eb7fiegr9mve"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID1y6WY8+wi6FMuZDBM90iIZJcuME/3eaD2gZYmrpcOU blizz@Draeston
        EOT
    }
    name                      = "yandex-terraform"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdr3djmqflpdn4mn1cq"
        disk_id     = "epdr3djmqflpdn4mn1cq"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8emvfmfoaordspe1jr"
            size       = 20
            type       = "network-ssd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "10.228.0.27"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:13:0f:44:17"
        nat                = true
        nat_ip_address     = "84.201.143.98"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2l2oji1ve8681319eif"
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

    timeouts {
        create = "10m"
        delete = "10m"
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2023-02-11T18:54:30Z"
    folder_id  = "b1gb6dqdqpvg2u2f1hj3"
    id         = "enppdgtjvkaq62jbohus"
    labels     = {}
    name       = "ya-network"
    subnet_ids = []
}

# yandex_vpc_subnet.default:
resource "yandex_vpc_subnet" "default" {
    created_at     = "2023-02-11T18:57:22Z"
    folder_id      = "b1gb6dqdqpvg2u2f1hj3"
    id             = "e2l2oji1ve8681319eif"
    labels         = {}
    name           = "ya-network"
    network_id     = "enppdgtjvkaq62jbohus"
    v4_cidr_blocks = [
        "10.228.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}
```

```
terraform state list

data.yandex_compute_image.default
yandex_compute_instance.default
yandex_vpc_network.network-1
yandex_vpc_subnet.default
```

## Applying changes
```
  # yandex_compute_instance.default must be replaced
-/+ resource "yandex_compute_instance" "default" {
      ~ created_at                = "2023-02-11T18:57:25Z" -> (known after apply)
      ~ folder_id                 = "b1gb6dqdqpvg2u2f1hj3" -> (known after apply)
      ~ fqdn                      = "yandex-terraform.ru-central1.internal" -> (known after apply)
      ~ id                        = "epdj1t21eb7fiegr9mve" -> (known after apply)
      - labels                    = {} -> null
        name                      = "yandex-terraform"
      + service_account_id        = (known after apply)
      ~ status                    = "running" -> (known after apply)
      ~ zone                      = "ru-central1-b" -> "ru-central1-a" # forces replacement
        # (4 unchanged attributes hidden)

      ~ boot_disk {
          ~ device_name = "epdr3djmqflpdn4mn1cq" -> (known after apply)
          ~ disk_id     = "epdr3djmqflpdn4mn1cq" -> (known after apply)
          ~ mode        = "READ_WRITE" -> (known after apply)
            # (1 unchanged attribute hidden)

          ~ initialize_params {
              ~ block_size  = 4096 -> (known after apply)
              + description = (known after apply)
              + name        = (known after apply)
              + snapshot_id = (known after apply)
              ~ type        = "network-ssd" -> "network-nvme" # forces replacement
                # (2 unchanged attributes hidden)
            }
        }

      ~ network_interface {
          ~ index              = 0 -> (known after apply)
          ~ ip_address         = "10.228.0.27" -> (known after apply)
          ~ ipv6               = false -> (known after apply)
          + ipv6_address       = (known after apply)
          ~ mac_address        = "d0:0d:13:0f:44:17" -> (known after apply)
          ~ nat_ip_address     = "84.201.143.98" -> (known after apply)
          ~ nat_ip_version     = "IPV4" -> (known after apply)
          ~ security_group_ids = [] -> (known after apply)
          ~ subnet_id          = "e2l2oji1ve8681319eif" -> (known after apply)
            # (2 unchanged attributes hidden)
        }

      ~ placement_policy {
          ~ host_affinity_rules = [] -> (known after apply)
          + placement_group_id  = (known after apply)
        }

      ~ resources {
          - gpus          = 0 -> null
            # (3 unchanged attributes hidden)
        }

      ~ scheduling_policy {
          ~ preemptible = false -> (known after apply)
        }

        # (1 unchanged block hidden)
    }

  # yandex_vpc_subnet.default must be replaced
-/+ resource "yandex_vpc_subnet" "default" {
      ~ created_at     = "2023-02-11T18:57:22Z" -> (known after apply)
      ~ folder_id      = "b1gb6dqdqpvg2u2f1hj3" -> (known after apply)
      ~ id             = "e2l2oji1ve8681319eif" -> (known after apply)
      ~ labels         = {} -> (known after apply)
        name           = "ya-network"
      ~ v6_cidr_blocks = [] -> (known after apply)
      ~ zone           = "ru-central1-b" -> "ru-central1-a" # forces replacement
        # (2 unchanged attributes hidden)
    }

Plan: 2 to add, 0 to change, 2 to destroy.
```

Output
```
address = "84.201.159.225"
name = "yandex-terraform"
```

# Best practices
- I'm using divided files for main logic, variables and outputs which make working with the terraform much easier
- I'm not putting confidential or sensitive information in the code itself, using environment variables
- I'm using ```terraform fmt```, ```terraform plan``` and ```terraform validate```