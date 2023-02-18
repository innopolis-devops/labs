# Docker #

```
PS C:\users\dappa\devops\devops\terraform\docker> terraform show
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
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    group_add                                   = []
    hostname                                    = "3818426724b4"
    id                                          = "3818426724b40edc05973fe49d4da570094cd1b836e7e41235c7a33dcd518d09"
    image                                       = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "tutorial"
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
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94nginx:latest"
    image_id     = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94"
    keep_locally = false
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:6650513efd1d27c1f8a5351cbd33edf85cc7e0d9d0fcb4ffb23d8fa89b601ba8"
}


Outputs:

container_id = "3818426724b40edc05973fe49d4da570094cd1b836e7e41235c7a33dcd518d09"
image_id = "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94nginx:latest"
```

```
PS C:\users\dappa\devops\devops\terraform\docker> terraform state list
docker_container.nginx
docker_image.nginx
```

# Yandex Cloud / instead of AWS #

```
PS C:\users\dappa\devops\devops\terraform\yc> terraform show
# yandex_compute_instance.instance-1:
resource "yandex_compute_instance" "instance-1" {
    created_at                = "2023-02-18T20:35:56Z"
    folder_id                 = "b1gtcfr2s8rhpphfmpc4"
    fqdn                      = "fhm7dih3jurn5u08c43s.auto.internal"
    id                        = "fhm7dih3jurn5u08c43s"
    name                      = "instance1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmpehkuc8iaog19kqb3"
        disk_id     = "fhmpehkuc8iaog19kqb3"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8id3ghkbp201h40o60"
            size       = 50
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
        ip_address         = "10.0.0.28"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:76:ca:23:9f"
        nat                = false
        security_group_ids = []
        subnet_id          = "e9bqa38uca7jlgbmo6vu"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 4
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at = "2023-02-18T20:33:36Z"
    folder_id  = "b1gtcfr2s8rhpphfmpc4"
    id         = "enpvj2fq5nirnv54efm2"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9bqa38uca7jlgbmo6vu",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-02-18T20:33:38Z"
    folder_id      = "b1gtcfr2s8rhpphfmpc4"
    id             = "e9bqa38uca7jlgbmo6vu"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpvj2fq5nirnv54efm2"
    v4_cidr_blocks = [
        "10.0.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
PS C:\users\dappa\devops\devops\terraform\yc>
```


```
PS C:\users\dappa\devops\devops\terraform\yc> terraform state list
yandex_compute_instance.instance-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```
