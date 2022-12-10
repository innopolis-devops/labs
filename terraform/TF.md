## Docker 
```sh
timur@MacBook-Pro docker % terraform show 
# docker_container.msc_time:
resource "docker_container" "msc_time" {
    attach                                      = false
    command                                     = [
        "python",
        "./app.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    gateway                                     = "172.17.0.1"
    hostname                                    = "366670b7c694"
    id                                          = "366670b7c69419f116f8b38b904dcbe53d359a7320ca93576a6ba82186d658b8"
    image                                       = "sha256:bdaf7a632691509395efbe04df571a587f1839a33d092a7db37c84cb67a3c470"
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
    name                                        = "python_app_msk_time"
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
    user                                        = "app_user"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 8000
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
timur@MacBook-Pro docker % 
```

```sh
timur@MacBook-Pro docker % terraform state list
docker_container.msc_time
```


## Yandex Cloud (Instead of AWS)

```sh
timur@MacBook-Pro YC % terraform show
# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-12-10T19:37:46Z"
    folder_id                 = "b1geg3ib2ju4e1gb8ijb"
    fqdn                      = "epd0kgcrnvc0rir95sl5.auto.internal"
    id                        = "epd0kgcrnvc0rir95sl5"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: <имя пользователя>
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAB3Nza......OjbSMRX user@example.com
                  - ssh-ed25519 AAAAB3Nza......Pu00jRN user@desktop
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdggoish1uq7l23bkf3"
        disk_id     = "epdggoish1uq7l23bkf3"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8klm3jujqmr4ib97sb"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.21"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:a4:19:bb:fd"
        nat                = true
        nat_ip_address     = "84.201.179.226"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e2lot3kk1m6ftk3msvr7"
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
    created_at = "2022-12-10T19:37:43Z"
    folder_id  = "b1geg3ib2ju4e1gb8ijb"
    id         = "enpt5msutd1kqv1gjfrk"
    labels     = {}
    name       = "network1"
    subnet_ids = []
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-12-10T19:37:44Z"
    folder_id      = "b1geg3ib2ju4e1gb8ijb"
    id             = "e2lot3kk1m6ftk3msvr7"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpt5msutd1kqv1gjfrk"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}
timur@MacBook-Pro YC % 

```

```sh
timur@MacBook-Pro YC % terraform state list 

yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

## Best practicies
- Follow a standard module structure.
- Adopt a naming convention.
- Use variables carefully.
- Limit the use of custom scripts.