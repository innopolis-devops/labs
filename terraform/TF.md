## Best practices to create & organize Terraform code
1. Use separate state locations based on logical environment boundaries.
2. Encryption of credentials is important!
3. Keep your modules and your environment implementation code separate.
4. Decompose and abstract your terraform code to maximize reuse.
5. Use variable files:

    They can be set in a number of ways:
    * In variable.tf file
    * As environment variables.
    * Individually, with the -var command-line option.
    * In variable definitions (.tfvars) files, either specified on the command line or automatically loaded.
6. Structuring of Terraform configurations:

    Terraform code can be written in a single file but it would be better if we have several files split logically:
    * main.tf — call modules, locals and data-sources to create all the resources
    * variables.tf — contains information of variables used in main.tf
    * outputs.tf — contains outputs from the resources generated in main.tf

    By splitting the files in this format it helps in reusability and sharing of code as well as helps in improving whenever required.

## References
* https://www.xtivia.com/blog/cloud/terraform-best-practices/
* https://medium.com/xebia-engineering/best-practices-to-create-organize-terraform-code-for-aws-2f4162525a1a\


## Output of commands: 
I was following this tutorial (btw this company (aka Yandex) is better than stinky Amazon) https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#configure-terraform

## Docker output of terraform show

```bash
❯ terraform show
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
    hostname          = "97523130dbba"
    id                = "97523130dbba2f74626f31c5c524b9bba80f861d9bded60f6ff2b15e1cb3a38d"
    image             = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
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
    id           = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230bnginx:latest"
    keep_locally = false
    latest       = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:859ab6768a6f26a79bc42b231664111317d095a4f04e4b6fe79ce37b3d199097"
}

```
## Docker state list
```bash
❯ terraform state list
docker_container.nginx
docker_image.nginx

```

## Docker second output of terraform show 

```bash
❯ terraform show
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
    hostname          = "fe032063aae3"
    id                = "fe032063aae353d4027506cd1d440d14936a3314b9be8df12ae86df68fb2f1be"
    image             = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
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
    id           = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230bnginx:latest"
    keep_locally = false
    latest       = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:859ab6768a6f26a79bc42b231664111317d095a4f04e4b6fe79ce37b3d199097"
}
```

## Docker third terraform show 

```bash 
❯ terraform show
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
    hostname          = "1b31520b809c"
    id                = "1b31520b809ccd762ceb1c54f5d976c3e5060bd2186dcbb1635bd9c694d8f3cb"
    image             = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
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
    id           = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230bnginx:latest"
    keep_locally = false
    latest       = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230b"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:859ab6768a6f26a79bc42b231664111317d095a4f04e4b6fe79ce37b3d199097"
}
```

## Outputs:

```bash
Outputs:

container_id = "1b31520b809ccd762ceb1c54f5d976c3e5060bd2186dcbb1635bd9c694d8f3cb"
image_id = "sha256:fa5269854a5e615e51a72b17ad3fd1e01268f278a6684c8ed3c5f0cdce3f230bnginx:latest"
```

## Yandex cloud terraform ouput 

```bash
❯ terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T19:13:41Z"
    folder_id                 = "b1gpu76ok8gkilpdbm3l"
    fqdn                      = "fhm47qja5o7sm51tuvbr.auto.internal"
    id                        = "fhm47qja5o7sm51tuvbr"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeGq6m8pdyqmL8C7e55xIhlR6xQWixuS1iSyi1/m95FtBKq7R791QHPkPS8QtH5rreNOzVQh4865OVsg5MICda5i+smXZ5UIjAJmFlLGiMdD7MXrwpbnu6KU2VYVbD7IfFjhipEyugEhD/fNjFrhI2Bfs0pC0H2bDE7dCbFm8NP5yg6Sw2KJfsyWOuaFLpP4pp+RJbd+mG+HOs4UpzIYp7NgSFz7qbMTtDXaADBM8xQQ6SOHjDWwB8SlA4Rtrar+itSeEMMtYKhoft47jZl1rd+3Tx4lNiGXCLq4PQpdpRJJ7zHD0G4T4tdDkYIjhcQUHjIuXBk/OnNY2olBhCi7hF justmark0@justmark0-2osx
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmqq9t5q8ma1i1ju1eu"
        disk_id     = "fhmqq9t5q8ma1i1ju1eu"
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
        ip_address         = "192.168.10.24"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:43:ea:6a:2e"
        nat                = true
        nat_ip_address     = "130.193.51.45"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9burt3ihk22f2rgl4fo"
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
    created_at                = "2022-09-26T19:13:41Z"
    folder_id                 = "b1gpu76ok8gkilpdbm3l"
    fqdn                      = "fhmp10kjt70sqqkc1el3.auto.internal"
    id                        = "fhmp10kjt70sqqkc1el3"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeGq6m8pdyqmL8C7e55xIhlR6xQWixuS1iSyi1/m95FtBKq7R791QHPkPS8QtH5rreNOzVQh4865OVsg5MICda5i+smXZ5UIjAJmFlLGiMdD7MXrwpbnu6KU2VYVbD7IfFjhipEyugEhD/fNjFrhI2Bfs0pC0H2bDE7dCbFm8NP5yg6Sw2KJfsyWOuaFLpP4pp+RJbd+mG+HOs4UpzIYp7NgSFz7qbMTtDXaADBM8xQQ6SOHjDWwB8SlA4Rtrar+itSeEMMtYKhoft47jZl1rd+3Tx4lNiGXCLq4PQpdpRJJ7zHD0G4T4tdDkYIjhcQUHjIuXBk/OnNY2olBhCi7hF justmark0@justmark0-2osx
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmja6a04np9r7c8bbh4"
        disk_id     = "fhmja6a04np9r7c8bbh4"
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
        ip_address         = "192.168.10.25"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:19:08:29:3e"
        nat                = true
        nat_ip_address     = "130.193.50.21"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9burt3ihk22f2rgl4fo"
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
    created_at = "2022-09-26T19:13:38Z"
    folder_id  = "b1gpu76ok8gkilpdbm3l"
    id         = "enpq5fpvknh3e8vt9l31"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T19:13:39Z"
    folder_id      = "b1gpu76ok8gkilpdbm3l"
    id             = "e9burt3ihk22f2rgl4fo"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpq5fpvknh3e8vt9l31"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "130.193.51.45"
external_ip_address_vm_2 = "130.193.50.21"
internal_ip_address_vm_1 = "192.168.10.24"
internal_ip_address_vm_2 = "192.168.10.25"
```

## Yandex cloud state list

```bash
❯ terraform state list
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

## Yandex cloud terraform show command

```bash
❯ terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T19:13:41Z"
    folder_id                 = "b1gpu76ok8gkilpdbm3l"
    fqdn                      = "fhm47qja5o7sm51tuvbr.auto.internal"
    id                        = "fhm47qja5o7sm51tuvbr"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeGq6m8pdyqmL8C7e55xIhlR6xQWixuS1iSyi1/m95FtBKq7R791QHPkPS8QtH5rreNOzVQh4865OVsg5MICda5i+smXZ5UIjAJmFlLGiMdD7MXrwpbnu6KU2VYVbD7IfFjhipEyugEhD/fNjFrhI2Bfs0pC0H2bDE7dCbFm8NP5yg6Sw2KJfsyWOuaFLpP4pp+RJbd+mG+HOs4UpzIYp7NgSFz7qbMTtDXaADBM8xQQ6SOHjDWwB8SlA4Rtrar+itSeEMMtYKhoft47jZl1rd+3Tx4lNiGXCLq4PQpdpRJJ7zHD0G4T4tdDkYIjhcQUHjIuXBk/OnNY2olBhCi7hF justmark0@justmark0-2osx
        EOT
    }
    name                      = "vm1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmqq9t5q8ma1i1ju1eu"
        disk_id     = "fhmqq9t5q8ma1i1ju1eu"
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
        ip_address         = "192.168.10.24"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:43:ea:6a:2e"
        nat                = true
        nat_ip_address     = "130.193.51.45"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9burt3ihk22f2rgl4fo"
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
    created_at                = "2022-09-26T19:13:41Z"
    folder_id                 = "b1gpu76ok8gkilpdbm3l"
    fqdn                      = "fhmp10kjt70sqqkc1el3.auto.internal"
    id                        = "fhmp10kjt70sqqkc1el3"
    labels                    = {}
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeGq6m8pdyqmL8C7e55xIhlR6xQWixuS1iSyi1/m95FtBKq7R791QHPkPS8QtH5rreNOzVQh4865OVsg5MICda5i+smXZ5UIjAJmFlLGiMdD7MXrwpbnu6KU2VYVbD7IfFjhipEyugEhD/fNjFrhI2Bfs0pC0H2bDE7dCbFm8NP5yg6Sw2KJfsyWOuaFLpP4pp+RJbd+mG+HOs4UpzIYp7NgSFz7qbMTtDXaADBM8xQQ6SOHjDWwB8SlA4Rtrar+itSeEMMtYKhoft47jZl1rd+3Tx4lNiGXCLq4PQpdpRJJ7zHD0G4T4tdDkYIjhcQUHjIuXBk/OnNY2olBhCi7hF justmark0@justmark0-2osx
        EOT
    }
    name                      = "vm2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmja6a04np9r7c8bbh4"
        disk_id     = "fhmja6a04np9r7c8bbh4"
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
        ip_address         = "192.168.10.25"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:19:08:29:3e"
        nat                = true
        nat_ip_address     = "130.193.50.21"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9burt3ihk22f2rgl4fo"
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
    created_at = "2022-09-26T19:13:38Z"
    folder_id  = "b1gpu76ok8gkilpdbm3l"
    id         = "enpq5fpvknh3e8vt9l31"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9burt3ihk22f2rgl4fo",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T19:13:39Z"
    folder_id      = "b1gpu76ok8gkilpdbm3l"
    id             = "e9burt3ihk22f2rgl4fo"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpq5fpvknh3e8vt9l31"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "130.193.51.45"
external_ip_address_vm_2 = "130.193.50.21"
internal_ip_address_vm_1 = "192.168.10.24"
internal_ip_address_vm_2 = "192.168.10.25"
```

## Yandex cloud terraform output

```bash
❯ terraform output
external_ip_address_vm_1 = "130.193.51.45"
external_ip_address_vm_2 = "130.193.50.21"
internal_ip_address_vm_1 = "192.168.10.24"
internal_ip_address_vm_2 = "192.168.10.25"
```
