# Terraform Lab

* [Docker](#docker)
* [YandexCloud](#yandexcloud)
* [Best Practices](#best-practices)

#Docker

## 1 Build Infrastructure Step (Docker)
* Added main.tf file
* Executed `terraform init`
* Executed `terraform apply`

```bash
>$ terraform show

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
    hostname          = "8a65912df007"
    id                = "8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d"
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
    name              = "nginx-container-tutorial"
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

```bash
>$ terraform state list

docker_container.nginx
docker_image.nginx
```

## 2 Changed Infrastructure Step (Docker)
* Port changed from 8000 to 8880
* Executed `terraform apply`

```bash
>$ terraform apply

docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
docker_container.nginx: Refreshing state... [id=8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
      + bridge            = (known after apply)
      ~ command           = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs    = (known after apply)
      - cpu_shares        = 0 -> null
      - dns               = [] -> null
      - dns_opts          = [] -> null
      - dns_search        = [] -> null
      ~ entrypoint        = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env               = [] -> (known after apply)
      + exit_code         = (known after apply)
      ~ gateway           = "172.17.0.1" -> (known after apply)
      - group_add         = [] -> null
      ~ hostname          = "8a65912df007" -> (known after apply)
      ~ id                = "8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
        name              = "nginx-container-tutorial"
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
          ~ external = 8000 -> 8888 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

docker_container.nginx: Destroying... [id=8a65912df007968990ceaa8dd8c7b8b4edb4641793a3088c17938e159985e14d]
docker_container.nginx: Destruction complete after 4s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 5s [id=7fa517c6948eea7d625bb73ae5e2cdcc7651048e07f4da308ae96e9a5ee6ca00]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

## 3 Output Step (Docker)
* Container was renamed to `nginx-container-tutorial-var`

* Variable `container_name` is set inside `variables.tf`

* Outputs `container_id` and `image_name` are set inside `outputs.tf`

* Executed `terraform apply`

```bash
>$ terraform output

container_id = "2ecad5b11978749540c34c5697c08e70aebcb4bc692d0af9f8bdce114af1b0f3"
image_name = "nginx:latest"
```

# YandexCloud

## 1 Build Infrastructure Step (YandexCloud)
* Added main.tf file
* Executed `terraform init`
* Executed `terraform apply`

```bash
>$ terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T21:05:25Z"
    folder_id                 = "b1glm7451ldbhntco79m"
    fqdn                      = "fhm2n2hbrg107mi13aeu.auto.internal"
    id                        = "fhm2n2hbrg107mi13aeu"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCr/dWQ29PHc+d3tvGN+sZGpEup9tskS3RJ5uTZpqSV4hubIw+IQU5ShZA5gdDCsv9QMqKwapP/W34+N4Y1UNSO8ZwO8bPQw8CuRzbQZOv+iypVzyjD27zWkHzZEWC2zT2cFQO98hOwMY/UxEeYFlONa6TZ/pLuQognwDRREc8O0V5VKUCgsSd7UGoX6EJq7UFyWjTbLQoewzr+MWlVjw/RI/Vrrg4p0XJD2qtJWvfa0oobRbczIVthwjjSQy+HkgSPktwaNVovFtXhi9iJgAGdjershzpNcG6BsmwY8P7KnbmHuvm+ADKi8++jcrH/QXJuLNvJNBSzxzdFuNNKdZ7v minina@minina-robots
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm9fojhcjdu9ge231dn"
        disk_id     = "fhm9fojhcjdu9ge231dn"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd80jdh4pvsj48qftb3d"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.17"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:2b:8a:2b:dc"
        nat                = true
        nat_ip_address     = "51.250.80.31"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b70pp8n0poeifctd9v"
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

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-26T21:05:21Z"
    folder_id  = "b1glm7451ldbhntco79m"
    id         = "enp74743tcfqm9bf69jn"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T21:05:23Z"
    folder_id      = "b1glm7451ldbhntco79m"
    id             = "e9b70pp8n0poeifctd9v"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp74743tcfqm9bf69jn"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
```

```bash
>$ terraform state list
yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

## 2 Changed Infrastructure Step (YandexCloud)
* Disable public IP
* Executed `terraform apply`

```bash
>$ terraform apply
yandex_vpc_network.network-1: Refreshing state... [id=enp74743tcfqm9bf69jn]
yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9b70pp8n0poeifctd9v]
yandex_compute_instance.vm-1: Refreshing state... [id=fhm2n2hbrg107mi13aeu]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-1" {
        id                        = "fhm2n2hbrg107mi13aeu"
        name                      = "terraform1"
        # (9 unchanged attributes hidden)

      ~ network_interface {
          ~ nat                = true -> false
            # (9 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.vm-1: Modifying... [id=fhm2n2hbrg107mi13aeu]
yandex_compute_instance.vm-1: Modifications complete after 7s [id=fhm2n2hbrg107mi13aeu]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

```

## 3 Output Step (YandexCloud)
* Enable public IP
* Variable `zone` is set inside `variables.tf`
* Outputs `internal_ip_address_vm_1` and `external_ip_address_vm_1` are set inside `outputs.tf`
* Executed `terraform apply`

```bash
>$ terraform output
internal_ip_address_vm_1 = "192.168.10.17"
```


# Best Practices
* Do not put secrets into repository
* Put inside .gitignore specific files for terraform and your secrets
* Put variables inside file named variables.tf 
* Put outputs inside file named outputs.tf
* Destroy modules after finishing work
* Use formatting `terraform fmt`
