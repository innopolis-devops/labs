# Docker Provider
1. Install terraform
2. Build Infrastructure
3. Provide the output of following commands in the `TF.md` file: 
```bash
[nailya@nailya docker]$ terraform show
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
    hostname          = "393d6d866ec5"
    id                = "393d6d866ec5a26c7e06a417e6a95386869721afcb924671e34a45371bec419a"
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
```bash
[nailya@nailya docker]$ terraform state list
docker_container.nginx
docker_image.nginx
```
4. Change Infrastructure, provide a part of the log with the applied changes in the `TF.md`.

    Port is changed from `8000` to `8080`:
```bash
[nailya@nailya docker]$ terraform show
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
    hostname          = "f6a1984bac88"
    id                = "f6a1984bac88ff68188e821cc6164d010a2d97bd78092abbb63b77542525f47c"
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
        external = 8080
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

5. Using Input variables rename your docker container.
    
    Added variables with `variables.tf` file:

```bash
[nailya@nailya docker]$ terraform show
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
    hostname          = "cdec65bbf725"
    id                = "cdec65bbf7259acb0bc6dc0c9c728532c51a34444b2b4398b360dddddb58cf46"
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
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

Renamed the docker container using `input variables`:

```bash
[nailya@nailya docker]$ terraform apply -var "container_name=AnotherName"
[nailya@nailya docker]$ terraform show
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
    hostname          = "cd0ec6bdf472"
    id                = "cd0ec6bdf4726108a0f68dcd2b1f43936401904654216ff2700b72713322d742"
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
    name              = "AnotherName"
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
    id           = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    keep_locally = false
    latest       = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}
```

6. Finish the tutorial and provide the output of the `terraform output` command in the `TF.md`.
```bash
[nailya@nailya docker]$ terraform output
container_id = "e1571646c2bd3268a431b7982c4d1c37525f4f09dda5e162872cf8652062686b"
image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
```


# Yandex Cloud Provider
_I followed [this tutorial](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-terraform) by **Yandex** (god bless them)_

1. Build Infrastructure
2. Create terraform `plan` and `apply`
```bash
[nailya@nailya yandex]$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be created
  + resource "yandex_compute_instance" "vm-1" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
            EOT
        }
      + name                      = "terraform1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd87va5cc00gaq2f5qfb"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.vm-2 will be created
  + resource "yandex_compute_instance" "vm-2" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
            EOT
        }
      + name                      = "terraform2"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd87va5cc00gaq2f5qfb"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.network-1 will be created
  + resource "yandex_vpc_network" "network-1" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "network1"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.subnet-1 will be created
  + resource "yandex_vpc_subnet" "subnet-1" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet1"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.10.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_vm_1 = (known after apply)
  + external_ip_address_vm_2 = (known after apply)
  + internal_ip_address_vm_1 = (known after apply)
  + internal_ip_address_vm_2 = (known after apply)
```

```bash
[nailya@nailya yandex]$ terraform apply
yandex_compute_instance.vm-2: Creation complete after 39s [id=fhmdkgn1l1n5el6e97mb]
yandex_compute_instance.vm-1: Creation complete after 39s [id=fhmm5epk4fsnmtlckb53]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_vm_1 = "84.252.129.240"
external_ip_address_vm_2 = "62.84.126.179"
internal_ip_address_vm_1 = "192.168.10.19"
internal_ip_address_vm_2 = "192.168.10.21"
```

3. Provide the output of following commands in the `TF.md file`: 
```bash
[nailya@nailya yandex]$ terraform show 
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T16:31:52Z"
    folder_id                 = "b1g4avqigmc7tnom5hbn"
    fqdn                      = "fhmm5epk4fsnmtlckb53.auto.internal"
    id                        = "fhmm5epk4fsnmtlckb53"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmnbk5tu7o0kc0035uc"
        disk_id     = "fhmnbk5tu7o0kc0035uc"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8autg36kchufhej85b"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.19"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:16:2b:b3:42"
        nat                = true
        nat_ip_address     = "84.252.129.240"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bo6q8runlm2fqdpr9g"
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
    created_at                = "2022-09-26T16:31:52Z"
    folder_id                 = "b1g4avqigmc7tnom5hbn"
    fqdn                      = "fhmdkgn1l1n5el6e97mb.auto.internal"
    id                        = "fhmdkgn1l1n5el6e97mb"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm0r76p9r05j4nk8dpf"
        disk_id     = "fhm0r76p9r05j4nk8dpf"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8autg36kchufhej85b"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.21"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:da:42:e1:a8"
        nat                = true
        nat_ip_address     = "62.84.126.179"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bo6q8runlm2fqdpr9g"
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
    created_at = "2022-09-26T16:05:42Z"
    folder_id  = "b1g4avqigmc7tnom5hbn"
    id         = "enp40d6md7d9ha9a7fu6"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bo6q8runlm2fqdpr9g",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T16:05:44Z"
    folder_id      = "b1g4avqigmc7tnom5hbn"
    id             = "e9bo6q8runlm2fqdpr9g"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp40d6md7d9ha9a7fu6"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "84.252.129.240"
external_ip_address_vm_2 = "62.84.126.179"
internal_ip_address_vm_1 = "192.168.10.19"
internal_ip_address_vm_2 = "192.168.10.21"
```

```bash
[nailya@nailya yandex]$ terraform state list
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

4. Change infrastructure, provide a part of the log with the applied changes in the `TF.md`; rename your virtual machines names using variables with `variables.tf` file:
```bash
[nailya@nailya yandex]$ terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T16:31:52Z"
    folder_id                 = "b1g4avqigmc7tnom5hbn"
    fqdn                      = "fhmm5epk4fsnmtlckb53.auto.internal"
    id                        = "fhmm5epk4fsnmtlckb53"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
        EOT
    }
    name                      = "vm1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmnbk5tu7o0kc0035uc"
        disk_id     = "fhmnbk5tu7o0kc0035uc"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8autg36kchufhej85b"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.19"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:16:2b:b3:42"
        nat                = true
        nat_ip_address     = "84.252.129.240"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bo6q8runlm2fqdpr9g"
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
    created_at                = "2022-09-26T16:31:52Z"
    folder_id                 = "b1g4avqigmc7tnom5hbn"
    fqdn                      = "fhmdkgn1l1n5el6e97mb.auto.internal"
    id                        = "fhmdkgn1l1n5el6e97mb"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnaBO25Q3a7u/B/kdPDimnA7wJ9JEQf68xyo/yxbnM1Dv2oUQ6bvC43BO0fVJ350PPWibjueaKlVXkSDLKDpsMJ+DAF30mPiNEIljcT0Sq6T7L+wZAvUEV+18SqnfrfWWcSpMR+CUTpbo5dPpJGMux/mJpLB/JGXAil04FnJosSGtYe4U6H7m2+9iP/f96E8WPNRQ2AtBY3IuHseXNMvRHxoX/qIHlnsLi4KAQYCZha50BH0GQC0dvps5xsSGe9acHok3WQGe+BijVP/CFOhIVARO200EDw+Gh5fsEAJ9hBVLMy9a/HbjuH7yYRRECwZLMkHPzXk+Rx2OdNvthFTth nailya@nailya
        EOT
    }
    name                      = "vm2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm0r76p9r05j4nk8dpf"
        disk_id     = "fhm0r76p9r05j4nk8dpf"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8autg36kchufhej85b"
            size       = 5
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.21"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:da:42:e1:a8"
        nat                = true
        nat_ip_address     = "62.84.126.179"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bo6q8runlm2fqdpr9g"
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
    created_at = "2022-09-26T16:05:42Z"
    folder_id  = "b1g4avqigmc7tnom5hbn"
    id         = "enp40d6md7d9ha9a7fu6"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bo6q8runlm2fqdpr9g",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T16:05:44Z"
    folder_id      = "b1g4avqigmc7tnom5hbn"
    id             = "e9bo6q8runlm2fqdpr9g"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp40d6md7d9ha9a7fu6"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "84.252.129.240"
external_ip_address_vm_2 = "62.84.126.179"
internal_ip_address_vm_1 = "192.168.10.19"
internal_ip_address_vm_2 = "192.168.10.21"
```

5. Finish the tutorial and provide the output of the `terraform output` command in the `TF.md`.
```bash
[nailya@nailya yandex]$ terraform output
external_ip_address_vm_1 = "84.252.129.240"
external_ip_address_vm_2 = "62.84.126.179"
internal_ip_address_vm_1 = "192.168.10.19"
internal_ip_address_vm_2 = "192.168.10.21"
```


# Github Provider
1. Build GitHub infrastructure
2. Prepare `.tf` files that should include: 
    * repository name
    * repository description
    * visibility
    * default branch
    * branch protection rule for the default branch
3. Locate the sensitive token to `config.auto.tfvars` file
4. Build:
```bash
[nailya@nailya github]$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding integrations/github versions matching "~> 4.0"...
- Installing integrations/github v4.31.0...
- Installed integrations/github v4.31.0 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to
│ calculate lock file checksums locally for the following providers:
│   - integrations/github
│ 
│ The current .terraform.lock.hcl file only includes checksums for linux_amd64,
│ so Terraform running on another platform will fail to install these
│ providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Create and save the build plan to `deploy.tfplan` file:

```bash
[nailya@nailya github]$ terraform plan -out deploy.tfplan
github_repository.repo: Refreshing state... [id=DevOps-labs-terraform]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_branch_default.master will be created
  + resource "github_branch_default" "master" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "DevOps-labs-terraform"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "main"
      + repository_id                   = "DevOps-labs-terraform"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + required_approving_review_count = 1
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: deploy.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "deploy.tfplan"
```

Execute the plan in `deploy.tfplan` file and create a repository:

```bash
[nailya@nailya github]$ terraform apply deploy.tfplan
github_branch_default.master: Creating...
github_branch_default.master: Creation complete after 2s [id=DevOps-labs-terraform]
github_branch_protection.default: Creating...
github_branch_protection.default: Creation complete after 4s [id=BPR_kwDOIEr3Ls4Bv8Rz]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

5. Destroy:
    Create and save the destroy plan to `destroy.tfplan` file:

```bash
[nailya@nailya github]$ terraform plan -destroy -out destroy.tfplan
github_repository.repo: Refreshing state... [id=DevOps-labs-terraform]
github_branch_default.master: Refreshing state... [id=DevOps-labs-terraform]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOIEr3Ls4Bv8Rz]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # github_branch_default.master will be destroyed
  - resource "github_branch_default" "master" {
      - branch     = "main" -> null
      - id         = "DevOps-labs-terraform" -> null
      - repository = "DevOps-labs-terraform" -> null
    }

  # github_branch_protection.default will be destroyed
  - resource "github_branch_protection" "default" {
      - allows_deletions                = false -> null
      - allows_force_pushes             = false -> null
      - blocks_creations                = false -> null
      - enforce_admins                  = true -> null
      - id                              = "BPR_kwDOIEr3Ls4Bv8Rz" -> null
      - pattern                         = "main" -> null
      - push_restrictions               = [] -> null
      - repository_id                   = "DevOps-labs-terraform" -> null
      - require_conversation_resolution = true -> null
      - require_signed_commits          = false -> null
      - required_linear_history         = false -> null

      - required_pull_request_reviews {
          - dismiss_stale_reviews           = false -> null
          - dismissal_restrictions          = [] -> null
          - pull_request_bypassers          = [] -> null
          - require_code_owner_reviews      = false -> null
          - required_approving_review_count = 1 -> null
          - restrict_dismissals             = false -> null
        }
    }

  # github_repository.repo will be destroyed
  - resource "github_repository" "repo" {
      - allow_auto_merge            = false -> null
      - allow_merge_commit          = true -> null
      - allow_rebase_merge          = true -> null
      - allow_squash_merge          = true -> null
      - archived                    = false -> null
      - auto_init                   = true -> null
      - branches                    = [
          - {
              - name      = "main"
              - protected = false
            },
        ] -> null
      - default_branch              = "main" -> null
      - delete_branch_on_merge      = false -> null
      - description                 = "lab 4" -> null
      - etag                        = "W/\"ead8761b4cbf59ad7241823277ccbb586a80a37092f08d60c94f2a519050daf9\"" -> null
      - full_name                   = "nailyav/DevOps-labs-terraform" -> null
      - git_clone_url               = "git://github.com/nailyav/DevOps-labs-terraform.git" -> null
      - gitignore_template          = "VisualStudio" -> null
      - has_downloads               = false -> null
      - has_issues                  = true -> null
      - has_projects                = false -> null
      - has_wiki                    = true -> null
      - html_url                    = "https://github.com/nailyav/DevOps-labs-terraform" -> null
      - http_clone_url              = "https://github.com/nailyav/DevOps-labs-terraform.git" -> null
      - id                          = "DevOps-labs-terraform" -> null
      - is_template                 = false -> null
      - license_template            = "mit" -> null
      - merge_commit_message        = "PR_TITLE" -> null
      - merge_commit_title          = "MERGE_MESSAGE" -> null
      - name                        = "DevOps-labs-terraform" -> null
      - node_id                     = "R_kgDOIEr3Lg" -> null
      - private                     = false -> null
      - repo_id                     = 541783854 -> null
      - squash_merge_commit_message = "COMMIT_MESSAGES" -> null
      - squash_merge_commit_title   = "COMMIT_OR_PR_TITLE" -> null
      - ssh_clone_url               = "git@github.com:nailyav/DevOps-labs-terraform.git" -> null
      - svn_url                     = "https://github.com/nailyav/DevOps-labs-terraform" -> null
      - visibility                  = "public" -> null
      - vulnerability_alerts        = false -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: destroy.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "destroy.tfplan"
```

Execute the plan in `destroy.tfplan` file and destroy the repository:

```bash
[nailya@nailya github]$ terraform apply destroy.tfplan
github_branch_protection.default: Destroying... [id=BPR_kwDOIEr3Ls4Bv8Rz]
github_branch_protection.default: Destruction complete after 0s
github_branch_default.master: Destroying... [id=DevOps-labs-terraform]
github_branch_default.master: Destruction complete after 2s
github_repository.repo: Destroying... [id=DevOps-labs-terraform]
github_repository.repo: Destruction complete after 1s

Apply complete! Resources: 0 added, 0 changed, 3 destroyed.
```

6. Import your existing repository using `terraform import` command:

```bash
[nailya@nailya github]$ terraform import "github_repository.repo" "DevOps-labs"
github_repository.repo: Importing from ID "DevOps-labs"...
github_repository.repo: Import prepared!
  Prepared github_repository for import
github_repository.repo: Refreshing state... [id=DevOps-labs]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```


# Terraform Best Practices
1. Follow a standard module structure.
2. Adopt a naming convention.
3. Use variables carefully.
4. Expose outputs.
5. Use data sources.
6. Protect stateful resources.
7. Use built-in formatting.
8. Limit the complexity of expressions.