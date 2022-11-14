# Terraform

## Docker

### Initial infrastructure

#### terraform show:

```terraform
# docker_container.msctime:
resource "docker_container" "msctime" {
    attach                                      = false
    command                                     = [
        "gunicorn",
        "--bind",
        "0.0.0.0:8000",
        "msctime.app:app",
        "--reload",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "38a350599788"
    id                                          = "38a350599788686dca39e3d1a0420d1c7069d79cadc23190e284d2f399700add"
    image                                       = "sha256:7244cafe7cbd2b795ccbe2368341987d49b780163ddb3dd292c3e3cf4338979e"
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
    name                                        = "name"
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
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "app"
    working_dir                                 = "/home/app"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.msctime:
resource "docker_image" "msctime" {
    id           = "sha256:7244cafe7cbd2b795ccbe2368341987d49b780163ddb3dd292c3e3cf4338979efeydrauth/msctime:latest"
    image_id     = "sha256:7244cafe7cbd2b795ccbe2368341987d49b780163ddb3dd292c3e3cf4338979e"
    keep_locally = false
    latest       = "sha256:7244cafe7cbd2b795ccbe2368341987d49b780163ddb3dd292c3e3cf4338979e"
    name         = "feydrauth/msctime:latest"
    repo_digest  = "feydrauth/msctime@sha256:89189b430864eb580a00f34428d92199005a46b14cb26bb6e80436247dfdb31a"
}
```

#### terraform state list:

```terraform
docker_container.msctime
docker_image.msctime
```

### After changes

- Renamed the container
- Added outputs

#### terraform plan:

```terraform
  # docker_container.msctime must be replaced
-/+ resource "docker_container" "msctime" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "gunicorn",
          - "--bind",
          - "0.0.0.0:8000",
          - "msctime.app:app",
          - "--reload",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      ~ gateway                                     = "172.17.0.1" -> (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "0522d4a8e7aa" -> (known after apply)
      ~ id                                          = "0522d4a8e7aa7339e28379f9080262d6f24b89adae4c2a88ac137965bf5729bb" -> (known after apply)
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
      ~ name                                        = "name" -> "msctime" # forces replacement
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
      - user                                        = "app" -> null
      - working_dir                                 = "/home/app" -> null
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
  + container_id   = (known after apply)
  + container_name = "msctime"
  + image_name     = "feydrauth/msctime:latest"
  + ports          = [
      + "8000 -> 8000",
    ]
```
### Output

#### terrafrom output:

```terraform
container_id = "4503fdd2a71c83571d7319e60a8f7965967c17b4b3fa833e03f1ce0bb4227c04"
container_name = "msctime"
image_name = "feydrauth/msctime:latest"
ports = [
  "8000 -> 8000",
]
```

## Yandex Cloud

### Initial infrastructure

#### terraform show:
```terraform
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-24T12:29:32Z"
    folder_id                 = "b1gbjpr8ed6j2klne1r1"
    fqdn                      = "fhmdm2e31s2ssdtof0io.auto.internal"
    id                        = "fhmdm2e31s2ssdtof0io"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIJmtckNyeHzK0aK0JfXQ1QJODChnRnxK88f1EoWvjsh74Ockx+wJDbxOWXVNzFYuHktCU5Bxo9oCjZjAEMPK3KPKKraZuTC0SNwLwO9wKUGfaCJ978/67AwAhaRokC5FxVelTAtC+D1qwgn4++Ys4uCvU9ZI5c/E8yj07druwJfYjY
hB61Q4r8dgNwabnVMxkNCWxS4bMgMyDGgiS504zZLesyGivD358t9FfLGsTQgDJpERK/f+/idL9bzrQm/IuCvoFu8l14Rm/9dBr8BuShxeIA3kGlMZCIWISq9b/c+E6ePfZZb7zSva8zTIg+yma6rIrVGSpMOG3x/a9Tj4B atrei@DESKTOP-8KPC1B1
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm1lr6por3nki48n3hu"
        disk_id     = "fhm1lr6por3nki48n3hu"
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
        ip_address         = "192.168.10.3"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:db:09:c3:0f"
        nat                = true
        nat_ip_address     = "178.154.206.71"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bmdlctamu3bja61onh"
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
    created_at                = "2022-09-24T12:29:32Z"
    folder_id                 = "b1gbjpr8ed6j2klne1r1"
    fqdn                      = "fhmsrtju8je6ob6mn333.auto.internal"
    id                        = "fhmsrtju8je6ob6mn333"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIJmtckNyeHzK0aK0JfXQ1QJODChnRnxK88f1EoWvjsh74Ockx+wJDbxOWXVNzFYuHktCU5Bxo9oCjZjAEMPK3KPKKraZuTC0SNwLwO9wKUGfaCJ978/67AwAhaRokC5FxVelTAtC+D1qwgn4++Ys4uCvU9ZI5c/E8yj07druwJfYjY
hB61Q4r8dgNwabnVMxkNCWxS4bMgMyDGgiS504zZLesyGivD358t9FfLGsTQgDJpERK/f+/idL9bzrQm/IuCvoFu8l14Rm/9dBr8BuShxeIA3kGlMZCIWISq9b/c+E6ePfZZb7zSva8zTIg+yma6rIrVGSpMOG3x/a9Tj4B atrei@DESKTOP-8KPC1B1
        EOT
    }
    name                      = "terraform2"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmg097v004k5v0q9u9r"
        disk_id     = "fhmg097v004k5v0q9u9r"
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
        ip_address         = "192.168.10.24"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1c:df:67:e4"
        nat                = true
        nat_ip_address     = "178.154.205.79"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bmdlctamu3bja61onh"
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
    created_at = "2022-09-24T12:29:30Z"
    folder_id  = "b1gbjpr8ed6j2klne1r1"
    id         = "enpbqo576ka46noceotr"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-24T12:29:30Z"
    folder_id      = "b1gbjpr8ed6j2klne1r1"
    id             = "e9bmdlctamu3bja61onh"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpbqo576ka46noceotr"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
```

#### terraform state list:
```terraform
yandex_compute_instance.vm-1
yandex_compute_instance.vm-2
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

### After changes

- Parametrized number of cores and memory
- Added outputs

#### terraform plan:
```terraform
Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-1" {
      + allow_stopping_for_update = true
        id                        = "fhmdm2e31s2ssdtof0io"
        name                      = "terraform1"
        # (9 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

  # yandex_compute_instance.vm-2 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-2" {
      + allow_stopping_for_update = true
        id                        = "fhmsrtju8je6ob6mn333"
        name                      = "terraform2"
        # (9 unchanged attributes hidden)

      ~ resources {
          ~ cores         = 4 -> 2
          ~ memory        = 4 -> 2
            # (2 unchanged attributes hidden)
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 2 to change, 0 to destroy.
        
Changes to Outputs:
  + external_ip_address_vm_1 = "178.154.206.71"
  + external_ip_address_vm_2 = "178.154.205.79"
  + internal_ip_address_vm_1 = "192.168.10.3"
  + internal_ip_address_vm_2 = "192.168.10.24"
```

### Output

#### terraform output:
```terraform
external_ip_address_vm_1 = "178.154.206.71"
external_ip_address_vm_2 = "178.154.205.79"
internal_ip_address_vm_1 = "192.168.10.3"
internal_ip_address_vm_2 = "192.168.10.24"
```

## Best practices
- Use `variables.tf` and `outputs.tf` when applicable.
- Write description and type in variables
- Use built-in formatting (`terraform fmt`)
- Upload dependency lock to repo
- Use `.gitignore` for terraform
- Do not hardcode secrets, use env variables instead
