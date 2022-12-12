# Terraform

## Docker

`terraform show`:
```
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
    hostname          = "ad9c4b09cacf"
    id                = "ad9c4b09cacf397e25f224ab67b61d9add26bcc28f5500f2fcb7df48a8bada01"
    image             = "sha256:835769b1adc00213f0a8fc55ba2ba56f2fb2eb8684b54b0afa3400000f1a73a8"
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
    id           = "sha256:835769b1adc00213f0a8fc55ba2ba56f2fb2eb8684b54b0afa3400000f1a73a8nginx:latest"
    keep_locally = false
    latest       = "sha256:835769b1adc00213f0a8fc55ba2ba56f2fb2eb8684b54b0afa3400000f1a73a8"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:ab589a3c466e347b1c0573be23356676df90cd7ce2dbf6ec332a5f0a8b5e59db"
}
```

`terraform state list`:
```
docker_container.nginx
docker_image.nginx
```

`terraform apply -var="name=tuttuttut"`:
```
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
      ~ hostname          = "994691b3acfc" -> (known after apply)
      ~ id                = "994691b3acfcfcce6449fa43e61eda0a383171bc347fb6d882e017dc7798b4a2" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
      ~ name              = "tutorial" -> "tuttuttut" # forces replacement
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

        # (1 unchanged block hidden)
    }
```

`terraform output`:
```
docker_ip_address = "172.17.0.2"
```

## Yandex Cloud (kinda AWS)

`terraform show`:
```
# data.yandex_compute_image.ubuntu:
data "yandex_compute_image" "ubuntu" {
    created_at    = "2022-11-28T10:49:03Z"
    description   = "ubuntu 22.04 lts"
    family        = "ubuntu-2204-lts"
    folder_id     = "standard-images"
    id            = "fd8smb7fj0o91i68s15v"
    image_id      = "fd8smb7fj0o91i68s15v"
    labels        = {}
    min_disk_size = 5
    name          = "ubuntu-22-04-lts-v20221128"
    os_type       = "linux"
    pooled        = true
    product_ids   = [
        "f2e2vfhnv85mgdrpgkq7",
    ]
    size          = 4
    status        = "ready"
}

# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    allow_stopping_for_update = true
    created_at                = "2022-12-12T10:56:01Z"
    folder_id                 = "b1gqb6lmjq2k4erbuovs"
    fqdn                      = "fhmpir7i0lcusembdp0j.auto.internal"
    id                        = "fhmpir7i0lcusembdp0j"
    metadata                  = {
        "ssh-keys" = "user:ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhBKV2kaLiZavXXPyqbz2lTePDibtgkXHwR550/mJXCsNyDt+n5L8FXhlTskYxcWrmYPjg3vzw+EZg076O51m86nijMuNY6fhoSeRK/K1P+CMXXtoV8SLxBQpdvC2yh3305nQ1RaKAaolzBWMqPSrnJvnu1nmg7kTwiKOoRajzutBhv0N/04TuoQ/bAehiFT4rRB6CTq/kkBWrUJr4CoOCYBloFBrUAVITrm5CyVTAPzvlA2B4HVTlfi6UIKfLLldN83jz6gYjcSGgMcyI1iUDpsl8vb9tq7yvx331iPzU7yl/fDE87b0lyl+u6wh+xaUDeUnqY2BP3iHhqVmLJ457Q== rsa-key-20181104"
    }
    name                      = "tutorial"
    network_acceleration_type = "standard"
    platform_id               = "standard-v3"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmp2edjg6vqtv6pg1ci"
        disk_id     = "fhmp2edjg6vqtv6pg1ci"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8smb7fj0o91i68s15v"
            size       = 32
            type       = "network-ssd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.30"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:19:96:cf:20"
        nat                = true
        nat_ip_address     = "158.160.51.29"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9b21mhjhf2q5gc6tfnn"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 20
        cores         = 2
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.net:
resource "yandex_vpc_network" "net" {
    created_at = "2022-11-30T12:00:30Z"
    folder_id  = "b1gqb6lmjq2k4erbuovs"
    id         = "enpt18pnfb1j0o51ro03"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9b21mhjhf2q5gc6tfnn",
    ]

    timeouts {}
}

# yandex_vpc_subnet.subnet:
resource "yandex_vpc_subnet" "subnet" {
    created_at     = "2022-11-30T12:00:31Z"
    folder_id      = "b1gqb6lmjq2k4erbuovs"
    id             = "e9b21mhjhf2q5gc6tfnn"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpt18pnfb1j0o51ro03"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"

    timeouts {}
}


Outputs:

external_ip = "158.160.51.29"
```

`terraform state list`:
```
data.yandex_compute_image.ubuntu
yandex_compute_instance.vm-1
yandex_vpc_network.net
yandex_vpc_subnet.subnet
```

`terraform apply -var="name=tuttuttut"`:
```
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.net: Refreshing state... [id=enpt18pnfb1j0o51ro03]
data.yandex_compute_image.ubuntu: Read complete after 1s [id=fd8smb7fj0o91i68s15v]
yandex_vpc_subnet.subnet: Refreshing state... [id=e9b21mhjhf2q5gc6tfnn]
yandex_compute_instance.vm-1: Refreshing state... [id=fhmpir7i0lcusembdp0j]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be updated in-place
  ~ resource "yandex_compute_instance" "vm-1" {
        id                        = "fhmpir7i0lcusembdp0j"
      ~ name                      = "tutorial" -> "tuttuttut"
        # (10 unchanged attributes hidden)

        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_compute_instance.vm-1: Modifying... [id=fhmpir7i0lcusembdp0j]
yandex_compute_instance.vm-1: Modifications complete after 3s [id=fhmpir7i0lcusembdp0j]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

Outputs:

external_ip = "158.160.51.29"
```

`terraform output`:
```
external_ip = "158.160.51.29"
```