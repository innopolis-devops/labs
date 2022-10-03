# Terraform

## Docker

`terraform show` output:

```terraform
# docker_container.timeweb:
resource "docker_container" "timeweb" {
    attach            = false
    command           = [
        "gunicorn",
        "--workers",
        "5",
        "--bind",
        "0.0.0.0:50000",
        "wsgi:app",
    ]
    cpu_shares        = 0
    entrypoint        = []
    env               = []
    gateway           = "172.17.0.1"
    hostname          = "77fe0063ca1d"
    id                = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3"
    image             = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823"
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
    name              = "timeweb"
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
    user              = "python"
    working_dir       = "/app"

    ports {
        external = 50000
        internal = 50000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.timeweb:
resource "docker_image" "timeweb" {
    id           = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823passkeyra/timeweb:latest"
    keep_locally = false
    latest       = "sha256:ed7e93b27db45e9fe907058a8058557d026ddeea59e88405cb2d07c978d39823"
    name         = "passkeyra/timeweb:latest"
    repo_digest  = "passkeyra/timeweb@sha256:949f3840f6dce472b52ebdfc9b6dd6179e64831226f0177c4d0ca4dfcd57163c"
}


Outputs:

timeweb_container_id = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3"
timeweb_ports = 50000
```

`terraform state list`:

```
docker_container.timeweb
docker_image.timeweb
```

After changing container name:

```terraform
# docker_container.timeweb must be replaced
-/+ resource "docker_container" "timeweb" {
      + bridge            = (known after apply)
      ~ command           = [
          - "gunicorn",
          - "--workers",
          - "5",
          - "--bind",
          - "0.0.0.0:50000",
          - "wsgi:app",
        ] -> (known after apply)
      + container_logs    = (known after apply)
      - cpu_shares        = 0 -> null
      - dns               = [] -> null
      - dns_opts          = [] -> null
      - dns_search        = [] -> null
      ~ entrypoint        = [] -> (known after apply)
      ~ env               = [] -> (known after apply)
      + exit_code         = (known after apply)
      ~ gateway           = "172.17.0.1" -> (known after apply)
      - group_add         = [] -> null
      ~ hostname          = "77fe0063ca1d" -> (known after apply)
      ~ id                = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
      ~ name              = "timeweb" -> "timeweb-container" # forces replacement
      ~ network_data      = [
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
      - network_mode      = "default" -> null
      - privileged        = false -> null
      - publish_all_ports = false -> null
      ~ security_opts     = [] -> (known after apply)
      ~ shm_size          = 64 -> (known after apply)
      - sysctls           = {} -> null
      - tmpfs             = {} -> null
      - user              = "python" -> null
      - working_dir       = "/app" -> null
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

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ timeweb_container_id = "77fe0063ca1d3495450bdaebc12ce828b7de6983069fe2db9906c15f2f59c3d3" -> (known after apply)
```

`terraform output`:

```
timeweb_container_id = "4f0b0b542abe8e44c0d0068272fe1cdc568724913a0a3d9194e0d67306c327e1"
timeweb_ports = 50000
```

## Yandex cloud

`terraform show`:

```terraform
# yandex_compute_instance.box:
resource "yandex_compute_instance" "box" {
    created_at                = "2022-10-03T20:05:53Z"
    folder_id                 = "b1guhf0uvibbra2v2j2u"
    fqdn                      = "box.ru-central1.internal"
    hostname                  = "box"
    id                        = "fhmibei38t6mm7ul6r2q"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: user
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh-authorized-keys:
                  - ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAjkJ9LgfH0SH1pWea4cO8m7cjndaTgAYgLJclBvumMHNysv/Mnu+fC8okiZh/7fkI96X7Mjgt7P+4vQ0hYsx7U= user@box
        EOT
    }
    name                      = "timeweb-box"
    network_acceleration_type = "standard"
    platform_id               = "standard-v3"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmd5askdobsj69agg9n"
        disk_id     = "fhmd5askdobsj69agg9n"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8touptelufms7frnlm"
            size       = 25
            type       = "network-ssd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "10.10.10.10"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:12:5b:a4:34"
        nat                = true
        nat_ip_address     = "51.250.73.83"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bib2oaosio345q80h1"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 20
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.box_net:
resource "yandex_vpc_network" "box_net" {
    created_at = "2022-10-03T20:05:49Z"
    folder_id  = "b1guhf0uvibbra2v2j2u"
    id         = "enpdik0vkfaeroc6trno"
    labels     = {}
    name       = "box-net"
    subnet_ids = []
}

# yandex_vpc_subnet.box_subnet:
resource "yandex_vpc_subnet" "box_subnet" {
    created_at     = "2022-10-03T20:05:51Z"
    folder_id      = "b1guhf0uvibbra2v2j2u"
    id             = "e9bib2oaosio345q80h1"
    labels         = {}
    name           = "box-subnet"
    network_id     = "enpdik0vkfaeroc6trno"
    v4_cidr_blocks = [
        "10.10.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

box_ip = "51.250.73.83"
```

`terraform state list`:

```
yandex_compute_instance.box
yandex_vpc_network.box_net
yandex_vpc_subnet.box_subnet
```

After changing VM name:

```terraform
# yandex_compute_instance.box has changed
  ~ resource "yandex_compute_instance" "box" {
        id                        = "fhmibei38t6mm7ul6r2q"
      + labels                    = {}
        name                      = "timeweb-box"
        # (9 unchanged attributes hidden)





        # (5 unchanged blocks hidden)
    }

  # yandex_vpc_network.box_net has changed
  ~ resource "yandex_vpc_network" "box_net" {
        id         = "enpdik0vkfaeroc6trno"
        name       = "box-net"
      ~ subnet_ids = [
          + "e9bib2oaosio345q80h1",
        ]
        # (3 unchanged attributes hidden)
    }

  # yandex_compute_instance.box will be updated in-place
  ~ resource "yandex_compute_instance" "box" {
        id                        = "fhmibei38t6mm7ul6r2q"
      ~ name                      = "timeweb-box" -> "timeweb"
        # (10 unchanged attributes hidden)





        # (5 unchanged blocks hidden)
    }
```

`terraform output`:

```
box_ip = "51.250.73.83"
```

## Best practices

* Provide description for variables and outputs to make the code and infrastructure readable and understandable
* Follow name convention. Use recommended `-` instead of `_` in names of resources
* Expose outputs, organize `outputs.tf` file
* Avoid custom scripts if possible
* Use built-in formatting with `terraform fmt`
* Use `terraform validate` and `terraform plan` first
