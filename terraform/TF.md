# Docker tutorial

## Create
```sh
$ terraform show

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
    hostname          = "2085c61fe184"
    id                = "2085c61fe184b212bb5d2e7443e4b2514d4a9837aac8bb49f4b9f1a3c05eacba"
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
```sh
$ terraform state list

docker_container.nginx
docker_image.nginx
```

## Update
```sh
# update logs
docker_container.nginx: Destroying... [id=2085c61fe184b212bb5d2e7443e4b2514d4a9837aac8bb49f4b9f1a3c05eacba]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=bdbec49da2a0ddc1bee1f9cbd79077a2066af719e5dc4aeb162d9e8f335f69c3]
```

## Terraform Output
```sh
container_id = "d5a84ed5d74fa257a0df959623ea9ddccba79c44d2a1cea4eeb85e9d9572dd5c"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```

# Yandex

## Create
Results of terraform apply
```sh
yandex_vpc_subnet.subnet-1: Destroying... [id=e9bhcrh3k4a451vddsib]
yandex_vpc_subnet.subnet-1: Destruction complete after 10s
yandex_vpc_subnet.subnet-1: Creating...
yandex_vpc_subnet.subnet-1: Creation complete after 1s [id=e2lb83ksbnrom0sb1iep]
yandex_compute_instance.vm-2: Creating...
yandex_compute_instance.vm-1: Creating...
yandex_compute_instance.vm-2: Still creating... [10s elapsed]
yandex_compute_instance.vm-1: Still creating... [10s elapsed]
yandex_compute_instance.vm-2: Still creating... [20s elapsed]
yandex_compute_instance.vm-1: Still creating... [20s elapsed]
yandex_compute_instance.vm-1: Still creating... [30s elapsed]
yandex_compute_instance.vm-2: Still creating... [30s elapsed]
yandex_compute_instance.vm-2: Creation complete after 34s [id=epdbhaej2h75dbefek7u]
yandex_compute_instance.vm-1: Creation complete after 38s [id=epd9e1psrl8o2te8vmr2]

Apply complete! Resources: 3 added, 0 changed, 1 destroyed.

Outputs:

external_ip_address_vm_1 = "158.160.1.32"
external_ip_address_vm_2 = "158.160.13.89"
internal_ip_address_vm_1 = "192.168.10.27"
internal_ip_address_vm_2 = "192.168.10.19"
```

```sh
$ terraform show

# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T12:33:59Z"
    folder_id                 = "b1g5g8m7j9d6db2vobp4"
    fqdn                      = "epd9e1psrl8o2te8vmr2.auto.internal"
    id                        = "epd9e1psrl8o2te8vmr2"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5Igiv4feslwuFV+hWRSensDB5ZQKfFulaTmEjIhX7qpPwhWLYXUKB4p22BTVFJOXlrpGTcz1/C1h3Gm2DmdInXi5ZU1Txbfszin5EzvxWmlctC7rSh8wAIJK7sKR0MHWEb3lXfVVVHVcTbsq7keaCK/QbKDtYGW+3euuCLcVpAkJjHxuflJ3VXut3swSHdibvdT7fM1UMSuD+tUilUA8tRQbR5vZzXEtyuz0qE9Tfj84ipqqC6XwKOnItzZAh0BrfPpdWGcwlIghq87G0cUHNKKli8yP/czaBE4BEPJADs8Rt6hJkEnMuWHRX8KOULKUPdjX9YFCKhLaJTf0X6yFb nihon@nihon-pc
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epd32ug15o5c9jddm7ij"
        disk_id     = "epd32ug15o5c9jddm7ij"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8kdq6d0p8sij7h5qe3"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.27"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:97:07:3c:dd"
        nat                = true
        nat_ip_address     = "158.160.1.32"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2lb83ksbnrom0sb1iep"
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

# yandex_compute_instance.vm-2:
resource "yandex_compute_instance" "vm-2" {
    created_at                = "2022-09-26T12:33:59Z"
    folder_id                 = "b1g5g8m7j9d6db2vobp4"
    fqdn                      = "epdbhaej2h75dbefek7u.auto.internal"
    id                        = "epdbhaej2h75dbefek7u"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5Igiv4feslwuFV+hWRSensDB5ZQKfFulaTmEjIhX7qpPwhWLYXUKB4p22BTVFJOXlrpGTcz1/C1h3Gm2DmdInXi5ZU1Txbfszin5EzvxWmlctC7rSh8wAIJK7sKR0MHWEb3lXfVVVHVcTbsq7keaCK/QbKDtYGW+3euuCLcVpAkJjHxuflJ3VXut3swSHdibvdT7fM1UMSuD+tUilUA8tRQbR5vZzXEtyuz0qE9Tfj84ipqqC6XwKOnItzZAh0BrfPpdWGcwlIghq87G0cUHNKKli8yP/czaBE4BEPJADs8Rt6hJkEnMuWHRX8KOULKUPdjX9YFCKhLaJTf0X6yFb nihon@nihon-pc
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdbf92enfuskspu1hu7"
        disk_id     = "epdbf92enfuskspu1hu7"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8kdq6d0p8sij7h5qe3"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.19"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:b8:a9:d3:14"
        nat                = true
        nat_ip_address     = "158.160.13.89"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2lb83ksbnrom0sb1iep"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 4
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2022-09-26T12:26:05Z"
    folder_id  = "b1g5g8m7j9d6db2vobp4"
    id         = "enp29ghc0kbfab60jlqu"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bhcrh3k4a451vddsib",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T12:33:57Z"
    folder_id      = "b1g5g8m7j9d6db2vobp4"
    id             = "e2lb83ksbnrom0sb1iep"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp29ghc0kbfab60jlqu"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}


Outputs:

external_ip_address_vm_1 = "158.160.1.32"
external_ip_address_vm_2 = "158.160.13.89"
internal_ip_address_vm_1 = "192.168.10.27"
internal_ip_address_vm_2 = "192.168.10.19"
```

```sh
$ terraform state list

yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

## Output

```sh
$ terraform output

external_ip_address_vm_1 = "158.160.1.32"
external_ip_address_vm_2 = "158.160.13.89"
internal_ip_address_vm_1 = "192.168.10.27"
internal_ip_address_vm_2 = "192.168.10.19"
```

# Best practices
1. Do not hardcode tokens or secrets. Either use environment variables or filepaths (do not commit these files!)
2. Use `terraform fmt`. Better add to pre-commit hooks.
3. Use -out option with `terraform plan` so that its output is consistent with `terraform apply`
4. Use .gitignore for terraform
5. Keep variables and outputs in `variables.tf` and `outputs.tf` files respectively.
6. Make variables for reusable values like zones or image ids
