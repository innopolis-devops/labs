# Lab 4

## The Docker tutorial

1. [OK] Install Terraform
2. [OK] Build Infrastructure
3. [OK] Terraform show command output

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform> terraform show
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
        hostname                                    = "a0465da68f3f"
        id                                          = "a0465da68f3f53cae68dddf44208386b37246b08e9bb5a0fd570c8fac4d51c4e"
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
    ```

4. [OK] Terraform state list command output

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform> terraform state list
    docker_container.nginx
    docker_image.nginx
    ```

5. [OK] Change Infrastructure

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform\docker> terraform apply
    Acquiring state lock. This may take a few moments...
    docker_image.nginx: Refreshing state... [id=sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest]
    docker_container.nginx: Refreshing state... [id=55d8532e80633685561881d9414545fbf6c3a7a3cc746c17ed1555311b54b400]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
    -/+ destroy and then create replacement

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
        ~ gateway                                     = "172.17.0.1" -> (known after apply)
        - group_add                                   = [] -> null
        ~ hostname                                    = "55d8532e8063" -> (known after apply)
        ~ id                                          = "55d8532e80633685561881d9414545fbf6c3a7a3cc746c17ed1555311b54b400" -> (known after apply)
        ~ init                                        = false -> (known after apply)
        ~ ip_address                                  = "172.17.0.2" -> (known after apply)
        ~ ip_prefix_length                            = 16 -> (known after apply)
        ~ ipc_mode                                    = "private" -> (known after apply)
        - links                                       = [] -> null
        ~ log_driver                                  = "json-file" -> (known after apply)
        - log_opts                                    = {} -> null
        - max_retry_count                             = 0 -> null
        - memory                                      = 0 -> null
        - memory_swap                                 = 0 -> null
            name                                        = "tutorial"
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
            ~ external = 8000 -> 8080 # forces replacement
                # (3 unchanged attributes hidden)
            }
        }

    Plan: 1 to add, 0 to change, 1 to destroy.

    Changes to Outputs:
    ~ container_id = "55d8532e80633685561881d9414545fbf6c3a7a3cc746c17ed1555311b54b400" -> (known after apply)
    ╷
    │ Warning: Deprecated attribute
    │
    │   on main.tf line 20, in resource "docker_container" "nginx":
    │   20:   image = docker_image.nginx.latest
    │
    │ The attribute "latest" is deprecated. Refer to the provider documentation for details.
    │
    │ (and one more similar warning elsewhere)
    ```

6. [OK] Rename docker container

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform> terraform show
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
        hostname                                    = "e7606b97aa3e"
        id                                          = "e7606b97aa3e1ae0f55485e8e662a9bccaceee53df61e480137021d49f6c6763"
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
        name                                        = "LAB4"
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
    ```

7. [OK] Terraform output command

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform> terraform output
    container_id = "b6a93b02b206eebb1a7fab328899280512a3ec68236724af857c750b126e8a09"
    image_id = "sha256:2d389e545974d4a93ebdef09b650753a55f72d1ab4518d17a30c0e1b3e297444nginx:latest"
    ```

## The Yandex Cloud tutorial

1. [OK] Install Terraform
2. [OK] Build Infrastructure
3. [OK] Terraform show command output

    ```bash
    # yandex_compute_instance.vm-1:
    resource "yandex_compute_instance" "vm-1" {
        created_at                = "2022-09-26T18:14:54Z"
        folder_id                 = "b1gav4l7unnadij81uk2"
        fqdn                      = "fhmhap6fhau92hvv4719.auto.internal"
        id                        = "fhmhap6fhau92hvv4719"
        metadata                  = {
            "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcAkY625/FQFzCcNbKGo70+RrA6KOI4iqaLnMHFkEa5LIxfHN1Z86M9tT8JN9U70455y2XzZBVZWTbmULm/93yYW8gmccwHJB6HMRiUu0BnKxS44LqC+3B0HzLstl5L9BRcp5DVBgiAsrFb0vQUf2Mc9RpydTTBpX6VXQuHNQ6UNZ8vGLuvKK/BAxtfqys16pOYYH5TzxPVPcLnKgBQzeHy3ggF7xGT2hnWG5hWBmssU2kJvCZCCSHuMjZ+z1nWBciE76fRYwkALgXK0ZNn0ARuMbKbCE28xuANpPeVQF+xy1CJtxDdlHWTtMKnNjsZPIsaSegEUJ5CSr2Fcqs++hp nailya@nailya
            EOT
        }
        name                      = "terraform1"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhmun6qf3s3ou0od984f"
            disk_id     = "fhmun6qf3s3ou0od984f"
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
            ip_address         = "192.168.10.3"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:11:56:4c:f8"
            nat                = true
            nat_ip_address     = "51.250.5.137"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9bargcnpv6vgluir2tq"
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
        created_at                = "2022-09-26T18:14:54Z"
        folder_id                 = "b1gav4l7unnadij81uk2"
        fqdn                      = "fhmshbpsl5fv6bsneoah.auto.internal"
        id                        = "fhmshbpsl5fv6bsneoah"
        metadata                  = {
            "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcAkY625/FQFzCcNbKGo70+RrA6KOI4iqaLnMHFkEa5LIxfHN1Z86M9tT8JN9U70455y2XzZBVZWTbmULm/93yYW8gmccwHJB6HMRiUu0BnKxS44LqC+3B0HzLstl5L9BRcp5DVBgiAsrFb0vQUf2Mc9RpydTTBpX6VXQuHNQ6UNZ8vGLuvKK/BAxtfqys16pOYYH5TzxPVPcLnKgBQzeHy3ggF7xGT2hnWG5hWBmssU2kJvCZCCSHuMjZ+z1nWBciE76fRYwkALgXK0ZNn0ARuMbKbCE28xuANpPeVQF+xy1CJtxDdlHWTtMKnNjsZPIsaSegEUJ5CSr2Fcqs++hp nailya@nailya
            EOT
        }
        name                      = "terraform2"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhmiq3iuuph3iu0390d9"
            disk_id     = "fhmiq3iuuph3iu0390d9"
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
            ip_address         = "192.168.10.31"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:1c:8a:f3:ca"
            nat                = true
            nat_ip_address     = "51.250.76.210"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9bargcnpv6vgluir2tq"
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
        created_at = "2022-09-26T18:14:47Z"
        folder_id  = "b1gav4l7unnadij81uk2"
        id         = "enp7hd44a1igtsl9siou"
        labels     = {}
        name       = "network1"
        subnet_ids = []
    }

    # yandex_vpc_subnet.subnet-1:
    resource "yandex_vpc_subnet" "subnet-1" {
        created_at     = "2022-09-26T18:14:49Z"
        folder_id      = "b1gav4l7unnadij81uk2"
        id             = "e9bargcnpv6vgluir2tq"
        labels         = {}
        name           = "subnet1"
        network_id     = "enp7hd44a1igtsl9siou"
        v4_cidr_blocks = [
            "192.168.10.0/24",
        ]
        v6_cidr_blocks = []
        zone           = "ru-central1-a"
    }


    Outputs:

    external_ip_address_vm_1 = "51.250.5.137"
    external_ip_address_vm_2 = "51.250.76.210"
    internal_ip_address_vm_1 = "192.168.10.3"
    internal_ip_address_vm_2 = "192.168.10.31"
    ```

4. [OK] Terraform state list command output

    ```bash
    yandex_compute_instance.vm-1
    yandex_compute_instance.vm-2
    yandex_vpc_network.network-1
    yandex_vpc_subnet.subnet-1
    ```

5. [OK] Change Infrastructure

    ```bash
    # yandex_compute_instance.vm-1:
    resource "yandex_compute_instance" "vm-1" {
        created_at                = "2022-09-26T18:14:54Z"
        folder_id                 = "b1gav4l7unnadij81uk2"
        fqdn                      = "fhmhap6fhau92hvv4719.auto.internal"
        id                        = "fhmhap6fhau92hvv4719"
        labels                    = {}
        metadata                  = {
            "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcAkY625/FQFzCcNbKGo70+RrA6KOI4iqaLnMHFkEa5LIxfHN1Z86M9tT8JN9U70455y2XzZBVZWTbmULm/93yYW8gmccwHJB6HMRiUu0BnKxS44LqC+3B0HzLstl5L9BRcp5DVBgiAsrFb0vQUf2Mc9RpydTTBpX6VXQuHNQ6UNZ8vGLuvKK/BAxtfqys16pOYYH5TzxPVPcLnKgBQzeHy3ggF7xGT2hnWG5hWBmssU2kJvCZCCSHuMjZ+z1nWBciE76fRYwkALgXK0ZNn0ARuMbKbCE28xuANpPeVQF+xy1CJtxDdlHWTtMKnNjsZPIsaSegEUJ5CSr2Fcqs++hp nailya@nailya
            EOT
        }
        name                      = "vm1"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhmun6qf3s3ou0od984f"
            disk_id     = "fhmun6qf3s3ou0od984f"
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
            ip_address         = "192.168.10.3"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:11:56:4c:f8"
            nat                = true
            nat_ip_address     = "51.250.5.137"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9bargcnpv6vgluir2tq"
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
        created_at                = "2022-09-26T18:14:54Z"
        folder_id                 = "b1gav4l7unnadij81uk2"
        fqdn                      = "fhmshbpsl5fv6bsneoah.auto.internal"
        id                        = "fhmshbpsl5fv6bsneoah"
        labels                    = {}
        metadata                  = {
            "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcAkY625/FQFzCcNbKGo70+RrA6KOI4iqaLnMHFkEa5LIxfHN1Z86M9tT8JN9U70455y2XzZBVZWTbmULm/93yYW8gmccwHJB6HMRiUu0BnKxS44LqC+3B0HzLstl5L9BRcp5DVBgiAsrFb0vQUf2Mc9RpydTTBpX6VXQuHNQ6UNZ8vGLuvKK/BAxtfqys16pOYYH5TzxPVPcLnKgBQzeHy3ggF7xGT2hnWG5hWBmssU2kJvCZCCSHuMjZ+z1nWBciE76fRYwkALgXK0ZNn0ARuMbKbCE28xuANpPeVQF+xy1CJtxDdlHWTtMKnNjsZPIsaSegEUJ5CSr2Fcqs++hp nailya@nailya
            EOT
        }
        name                      = "vm2"
        network_acceleration_type = "standard"
        platform_id               = "standard-v1"
        status                    = "running"
        zone                      = "ru-central1-a"

        boot_disk {
            auto_delete = true
            device_name = "fhmiq3iuuph3iu0390d9"
            disk_id     = "fhmiq3iuuph3iu0390d9"
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
            ip_address         = "192.168.10.31"
            ipv4               = true
            ipv6               = false
            mac_address        = "d0:0d:1c:8a:f3:ca"
            nat                = true
            nat_ip_address     = "51.250.76.210"
            nat_ip_version     = "IPV4"
            security_group_ids = []
            subnet_id          = "e9bargcnpv6vgluir2tq"
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
        created_at = "2022-09-26T18:14:47Z"
        folder_id  = "b1gav4l7unnadij81uk2"
        id         = "enp7hd44a1igtsl9siou"
        labels     = {}
        name       = "network1"
        subnet_ids = [
            "e9bargcnpv6vgluir2tq",
        ]
    }

    # yandex_vpc_subnet.subnet-1:
    resource "yandex_vpc_subnet" "subnet-1" {
        created_at     = "2022-09-26T18:14:49Z"
        folder_id      = "b1gav4l7unnadij81uk2"
        id             = "e9bargcnpv6vgluir2tq"
        labels         = {}
        name           = "subnet1"
        network_id     = "enp7hd44a1igtsl9siou"
        v4_cidr_blocks = [
            "192.168.10.0/24",
        ]
        v6_cidr_blocks = []
        zone           = "ru-central1-a"
    }
    ```

6. [OK] Terraform output command

    ```bash
    external_ip_address_vm_1 = "51.250.5.137"
    external_ip_address_vm_2 = "51.250.76.210"
    internal_ip_address_vm_1 = "192.168.10.3"
    internal_ip_address_vm_2 = "192.168.10.31"
    ```

## The Github tutorial

1. [OK] terraform init

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform\github> terraform init

    Initializing the backend...

    Initializing provider plugins...
    - Reusing previous version of integrations/github from the dependency lock file
    - Using previously-installed integrations/github v4.31.0

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```

2. [OK] terraform plan -out deploy.tfplan

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform\github> terraform plan -out deploy.tfplan
    github_repository.repo: Refreshing state... [id=LABS_created]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
    + create

    Terraform will perform the following actions:

    # github_branch_default.main will be created
    + resource "github_branch_default" "main" {
        + branch     = "main"
        + id         = (known after apply)
        + repository = "LABS_created"
        }

    # github_branch_protection.default will be created
    + resource "github_branch_protection" "default" {
        + allows_deletions                = false
        + allows_force_pushes             = false
        + blocks_creations                = false
        + enforce_admins                  = true
        + id                              = (known after apply)
        + pattern                         = "main"
        + repository_id                   = "LABS_created"
        + require_conversation_resolution = true
        + require_signed_commits          = false
        + required_linear_history         = false

        + required_pull_request_reviews {
            + required_approving_review_count = 1
            }
        }

    Plan: 2 to add, 0 to change, 0 to destroy.

    ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Saved the plan to: deploy.tfplan

    To perform exactly these actions, run the following command to apply:
        terraform apply "deploy.tfplan"
    ```

3. [OK] terraform apply "deploy.tfplan"

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform\github> terraform apply "deploy.tfplan"
    github_branch_default.main: Creating...
    github_branch_default.main: Creation complete after 3s [id=LABS_created]
    github_branch_protection.default: Creating...
    github_branch_protection.default: Creation complete after 5s [id=BPR_kwDOIEnMBs4Bv61E]

    Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
    ```

4. [OK] terraform import "github_repository.repo" "labs"

    ```bash
    PS C:\Users\adren\OneDrive\Desktop\labs\terraform\github> terraform import "github_repository.repo" "labs"
    github_repository.repo: Importing from ID "labs"...
    github_repository.repo: Import prepared!
    Prepared github_repository for import
    github_repository.repo: Refreshing state... [id=labs]

    Import successful!

    The resources that were imported are shown above. These resources are now in
    your Terraform state and will henceforth be managed by Terraform.
    ```

## Terraform best practicies

-- Use terraform.tfvars for private variables

-- It is easier and faster to work with a smaller number of resources

-- Practice a consistent structure and naming covention

