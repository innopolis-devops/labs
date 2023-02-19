## Docker tutorial

The result of `terraform show`

```ps
Δ .\terraform.exe -chdir=terraform show
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "python3",
        "-m",
        "flask",
        "--app",
        "app_python/main",
        "run",
        "--host=0.0.0.0",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "5deee228ced7"
    id                                          = "5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88"
    image                                       = "sha256:3582bd5dc92a1f1bc0e161b81420e3f4f36cd588bc4eb909cbeca88d865b251b"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python"
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
    restart                                     = "always"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_timeout                                = 0
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/"

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```
The result of `terraform state list`:
```ps
Δ .\terraform.exe -chdir=terraform state list
docker_container.app_python
```
Changing architecture:
```ps

Δ .\terraform.exe -chdir=terraform apply
docker_container.app_python: Refreshing state... [id=5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.app_python must be replaced
-/+ resource "docker_container" "app_python" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "python3",
          - "-m",
          - "flask",
          - "--app",
          - "app_python/main",
          - "run",
          - "--host=0.0.0.0",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "5deee228ced7" -> (known after apply)
      ~ id                                          = "5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88" -> (known after apply)
      ~ image                                       = "sha256:3582bd5dc92a1f1bc0e161b81420e3f4f36cd588bc4eb909cbeca88d865b251b" -> "lab-4:latest" # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "app_python"
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
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - working_dir                                 = "/" -> null
        # (13 unchanged attributes hidden)

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
          ~ external = 8080 -> 5000 # forces replacement
          ~ internal = 80 -> 5000 # forces replacement
            # (2 unchanged attributes hidden)
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.app_python: Destroying... [id=5deee228ced720f7ab6a0ee1831344a0b4acbcf3bd85b31e399c03f195354c88]
docker_container.app_python: Destruction complete after 0s
docker_container.app_python: Creating...
docker_container.app_python: Creation complete after 2s [id=4dcbb280e5615bba62864545d59ce5ba2736f5212e0eb96b77884dcf01f935b1]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
Output variables:
```ps
Δ .\terraform.exe -chdir=terraform output
container_id = "ace8aa13fb38a081451fb0c66b29bd977357906d66a55a147cfcec5167ec1968"
```

## For Yandex Cloud with Terraform:
Followed [tutorial](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart). Basically, created 2 VM inside virtual network.

```ps
Δ .\terraform.exe -chdir=terraform/YandexCloud show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2023-02-10T17:33:24Z"
    folder_id                 = "b1g2sm14kf3ioeaohipu"
    fqdn                      = "fhmp6eu21m8jtahreo42.auto.internal"
    id                        = "fhmp6eu21m8jtahreo42"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9q+AOi1JR1rgtDBfBp7D1kZjESSPn+4eJCEGrq8gO1 admin@SENTIA
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmj7onfinl4v568tein"
        disk_id     = "fhmj7onfinl4v568tein"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd81d2d9ifd50gmvc03g"
            size       = 2
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.29"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:19:33:bc:20"
        nat                = true
        nat_ip_address     = "51.250.65.227"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bhop1j7irgam9jca4g"
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
    created_at                = "2023-02-10T17:33:24Z"
    folder_id                 = "b1g2sm14kf3ioeaohipu"
    fqdn                      = "fhmffccp9k6rva7963pi.auto.internal"
    id                        = "fhmffccp9k6rva7963pi"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9q+AOi1JR1rgtDBfBp7D1kZjESSPn+4eJCEGrq8gO1 admin@SENTIA
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm24r2ocdchpd8hirm4"
        disk_id     = "fhm24r2ocdchpd8hirm4"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd81d2d9ifd50gmvc03g"
            size       = 2
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.30"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:f7:b1:99:4d"
        nat                = true
        nat_ip_address     = "51.250.76.209"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bhop1j7irgam9jca4g"
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
    created_at = "2023-02-10T17:28:34Z"
    folder_id  = "b1g2sm14kf3ioeaohipu"
    id         = "enpmbhgvdh5f7ts1iem2"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bhop1j7irgam9jca4g",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-02-10T17:28:36Z"
    folder_id      = "b1g2sm14kf3ioeaohipu"
    id             = "e9bhop1j7irgam9jca4g"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpmbhgvdh5f7ts1iem2"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm_1 = "51.250.65.227"
external_ip_address_vm_2 = "51.250.76.209"
internal_ip_address_vm_1 = "192.168.10.29"
internal_ip_address_vm_2 = "192.168.10.30"
```
Result of `terraform state list` command:
```ps
Δ .\terraform.exe -chdir=terraform/YandexCloud state list
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```
