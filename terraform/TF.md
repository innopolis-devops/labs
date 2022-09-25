# Terraform

## Best practices applied

1. Use separate directories for each application
2. Declare all variables in variables.tf
3. Organize all outputs in an outputs.tf file
4. Meaningful descriptions for variables and outputs
5. Use built-in formatting - terraform fmt

## Docker infrastructure using Terraform

1. terraform show

    ```plain
        # docker_container.app_python:
        resource "docker_container" "app_python" {
            attach            = false
            command           = [
                "uvicorn",
                "main:app",
                "--host",
                "0.0.0.0",
            ]
            cpu_shares        = 0
            entrypoint        = []
            env               = []
            gateway           = "172.17.0.1"
            hostname          = "954734ba6d20"
            id                = "954734ba6d207c5127c50ad12fa60bd39c9e3d5bf73e6a0bdc5c413633774c07"
            image             = "sha256:efc580c723c3f756225fb7d300cba9e67b4f5bff04e99efb8c8305898531346f"
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
            name              = "python_kremlin_chimes"
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
            working_dir       = "/app"

            healthcheck {
                interval     = "10s"
                retries      = 2
                start_period = "0s"
                test         = [
                    "CMD-SHELL",
                    "curl -sS 127.0.0.1:8000 || exit 1",
                ]
                timeout      = "10s"
            }

            ports {
                external = 8000
                internal = 8000
                ip       = "0.0.0.0"
                protocol = "tcp"
            }
        }

        # docker_image.app_python:
        resource "docker_image" "app_python" {
            id           = "sha256:efc580c723c3f756225fb7d300cba9e67b4f5bff04e99efb8c8305898531346fdanmory/python_kremlin_chimes:latest"
            keep_locally = false
            latest       = "sha256:efc580c723c3f756225fb7d300cba9e67b4f5bff04e99efb8c8305898531346f"
            name         = "danmory/python_kremlin_chimes:latest"
            repo_digest  = "danmory/python_kremlin_chimes@sha256:181927afa5ca9a949b76d47fdc1447bf658e8e8680e5f004c5a434ad5126b782"
        }
    ```

2. terraform state list

    ```plain
        docker_container.app_python
        docker_image.app_python
    ```

3. part o the log with the applied changes after re-building infrastructure
(application port number was changed)

    ```plain
          # docker_container.app_python must be replaced
        -/+ resource "docker_container" "app_python" {
            + bridge            = (known after apply)
            ~ command           = [
                - "uvicorn",
                - "main:app",
                - "--host",
                - "0.0.0.0",
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
            ~ hostname          = "954734ba6d20" -> (known after apply)
            ~ id                = "954734ba6d207c5127c50ad12fa60bd39c9e3d5bf73e6a0bdc5c413633774c07" -> (known after apply)
            ~ init              = false -> (known after apply)
            ~ ip_address        = "172.17.0.2" -> (known after apply)
            ~ ip_prefix_length  = 16 -> (known after apply)
            ~ ipc_mode          = "private" -> (known after apply)
            - links             = [] -> null
            - log_opts          = {} -> null
            - max_retry_count   = 0 -> null
            - memory            = 0 -> null
            - memory_swap       = 0 -> null
                name              = "python_kremlin_chimes"
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
            - working_dir       = "/app" -> null
                # (12 unchanged attributes hidden)

            ~ healthcheck {
                ~ interval     = "10s" -> (known after apply)
                ~ retries      = 2 -> (known after apply)
                ~ start_period = "0s" -> (known after apply)
                ~ test         = [
                    - "CMD-SHELL",
                    - "curl -sS 127.0.0.1:8000 || exit 1",
                    ] -> (known after apply)
                ~ timeout      = "10s" -> (known after apply)
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
    ```

4. terraform output

    ```plain
        container_id = "5f4a9f9abfa9ddf00e558bdce813449db0d792797297e08d80b4f8fab31ccfab"
        image_id = "sha256:efc580c723c3f756225fb7d300cba9e67b4f5bff04e99efb8c8305898531346fdanmory/python_kremlin_chimes:latest"
    ```

## Yandex cloud infrastructure using Terraform

1. terraform show

    ```plain
        # yandex_compute_instance.vm-1:
        resource "yandex_compute_instance" "vm-1" {
            created_at                = "2022-09-25T16:34:58Z"
            folder_id                 = "b1gum9q8rr5sgkmq91qt"
            fqdn                      = "fhmscb0dc40n2vkpcspb.auto.internal"
            id                        = "fhmscb0dc40n2vkpcspb"
            metadata                  = {
                "ssh-keys" = <<-EOT
                    ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDE2ZujaTvTvvBhWvtPMWFVY7nlpX9OwRkoCRE8Qwi64vvMw4fsx4Qg/awwlzoCjGKwCsRP8fWYLlKySFGdV4ku82nQCGnO4RNtPQR0sZGhy+h9qMk0zRZrSu8jhvoBzlMdfhB4LMh4oVHhGKr8S7EW8sSdRVPdCm+9VlHyeWqa43pQfb7MF7DX9CCl+80OVyFRoiNyfKNBXSzMBALqymEywfmDn2QFniq3MqkfUg1TLjQNB7fhvC6EBdFyRAlU5QhLO9JI2VwsRVyFtJYDV5PPOPh8QODSX59A7oeYjq0psXbeoMKhNx92YJoxOGqdjZ4t1BaIjFEnTuiPwvwq3k+Z danila@danila-pc
                EOT
            }
            name                      = "terraform1"
            network_acceleration_type = "standard"
            platform_id               = "standard-v1"
            status                    = "running"
            zone                      = "ru-central1-a"

            boot_disk {
                auto_delete = true
                device_name = "fhm9amu2t9ifrnlsnbg6"
                disk_id     = "fhm9amu2t9ifrnlsnbg6"
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
                ip_address         = "192.168.10.30"
                ipv4               = true
                ipv6               = false
                mac_address        = "d0:0d:1c:62:c0:d6"
                nat                = true
                nat_ip_address     = "51.250.8.89"
                nat_ip_version     = "IPV4"
                security_group_ids = []
                subnet_id          = "e9bmu7onp7qcsvk4ve3h"
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
            created_at = "2022-09-25T16:34:56Z"
            folder_id  = "b1gum9q8rr5sgkmq91qt"
            id         = "enpp625vq2c8oc4ldtl0"
            labels     = {}
            name       = "network1"
            subnet_ids = []
        }

        # yandex_vpc_subnet.subnet-1:
        resource "yandex_vpc_subnet" "subnet-1" {
            created_at     = "2022-09-25T16:34:57Z"
            folder_id      = "b1gum9q8rr5sgkmq91qt"
            id             = "e9bmu7onp7qcsvk4ve3h"
            labels         = {}
            name           = "subnet1"
            network_id     = "enpp625vq2c8oc4ldtl0"
            v4_cidr_blocks = [
                "192.168.10.0/24",
            ]
            v6_cidr_blocks = []
            zone           = "ru-central1-a"
        }


        Outputs:

        external_ip_address_vm_1 = "51.250.8.89"
        internal_ip_address_vm_1 = "192.168.10.30"
    ```

2. terraform state list

    ```plain
        yandex_compute_instance.vm-1
        yandex_vpc_network.network-1
        yandex_vpc_subnet.subnet-1
    ```

3. part o the log with the applied changes after re-building infrastructure
(added 1GB of RAM)

    ```plain
        # yandex_compute_instance.vm-1 will be updated in-place
        ~ resource "yandex_compute_instance" "vm-1" {
            + allow_stopping_for_update = true
                id                        = "fhmscb0dc40n2vkpcspb"
                name                      = "terraform1"
                # (9 unchanged attributes hidden)

            ~ resources {
                ~ memory        = 2 -> 4
                    # (3 unchanged attributes hidden)
                }

                # (4 unchanged blocks hidden)
            }
    ```

4. terraform output

    ```plain
        external_ip_address_vm_1 = "51.250.72.105"
        internal_ip_address_vm_1 = "192.168.10.30"
    ```
