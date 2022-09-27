# Terraform outputs

## terraform show

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
    hostname          = "e25b5d3aa86a"
    id                = "e25b5d3aa86aec83f2a8c67ceeda18bc2e6e127c5b9dfd9a1d9c6cfdd1e63a76"
    image             = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
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
    id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}

## terraform state list 

docker_container.nginx
docker_image.nginx

## terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
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
      ~ hostname          = "e25b5d3aa86a" -> (known after apply)
      ~ id                = "e25b5d3aa86aec83f2a8c67ceeda18bc2e6e127c5b9dfd9a1d9c6cfdd1e63a76" -> (known after apply)
      ~ init              = false -> (known after apply)
      ~ ip_address        = "172.17.0.2" -> (known after apply)
      ~ ip_prefix_length  = 16 -> (known after apply)
      ~ ipc_mode          = "private" -> (known after apply)
      - links             = [] -> null
      - log_opts          = {} -> null
      - max_retry_count   = 0 -> null
      - memory            = 0 -> null
      - memory_swap       = 0 -> null
        name              = "tutorial"
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
      - storage_opts      = {} -> null
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

      ~ ports {
          ~ external = 8000 -> 8080 # forces replacement
            # (3 unchanged attributes hidden)
        }
    }

## terraform output


container_id = "b3e07d0d689bb161fa301f826b8fe97ffe44d40197546a1124921157f2965db7"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"


## terraform show (with yandex cloud)

# docker_container.nginx:
resource "docker_container" "nginx" {
    attach            = false
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    dns               = []
    dns_opts          = []
    dns_search        = []
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    env               = []
    gateway           = "172.17.0.1"
    group_add         = []
    hostname          = "b3e07d0d689b"
    id                = "b3e07d0d689bb161fa301f826b8fe97ffe44d40197546a1124921157f2965db7"
    image             = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    init              = false
    ip_address        = "172.17.0.2"
    ip_prefix_length  = 16
    ipc_mode          = "private"
    links             = []
    log_driver        = "json-file"
    log_opts          = {}
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
    storage_opts      = {}
    sysctls           = {}
    tmpfs             = {}
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
    id           = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
    keep_locally = false
    latest       = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983"
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1"
}

# yandex_compute_instance.vm-1:
resource "yandex_compute_instance" "vm-1" {
    created_at                = "2022-09-26T20:41:58Z"
    folder_id                 = "b1g4p6iou2kl2ripp82u"
    fqdn                      = "fhm3326gsqs39ganvgda.auto.internal"
    id                        = "fhm3326gsqs39ganvgda"
    metadata                  = {
        "user-data" = <<-EOT
            #cloud-config
            users:
              - name: tfuser
                groups: sudo
                shell: /bin/bash
                sudo: ['ALL=(ALL) NOPASSWD:ALL']
                ssh_authorized_keys:
                  - ssh-rsa x6WX92Wh2PYMXQEVN3JPSi6dkbo/XVpegbAui6LcILU dmitriytsaplya@Dmitriys-MacBook-Air.local
        EOT
    }
    name                      = "terraform1"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmmnu6ko58hbhv3cjqd"
        disk_id     = "fhmmnu6ko58hbhv3cjqd"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8i1jm58pic2so8cmkj"
            size       = 3
            type       = "network-hdd"
        }
    }

    network_interface {
        index              = 0
        ip_address         = "192.168.10.14"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:31:88:d0:e6"
        nat                = true
        nat_ip_address     = "51.250.4.193"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9ba2j94h9fbd5pdjuda"
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
    created_at = "2022-09-26T20:40:16Z"
    folder_id  = "b1g4p6iou2kl2ripp82u"
    id         = "enpjk8p0lpck67eb2iov"
    labels     = {}
    name       = "network1"
    subnet_ids = [
        "e9ba2j94h9fbd5pdjuda",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2022-09-26T20:40:17Z"
    folder_id      = "b1g4p6iou2kl2ripp82u"
    id             = "e9ba2j94h9fbd5pdjuda"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpjk8p0lpck67eb2iov"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

container_id = "b3e07d0d689bb161fa301f826b8fe97ffe44d40197546a1124921157f2965db7"
external_ip_address_vm_1 = "51.250.4.193"
image_id = "sha256:0c404972e13056a866875f2bf8a981a911dc17071f505b9dc72cdf08e0d40983nginx:latest"
internal_ip_address_vm_1 = "192.168.10.14"

## terraform state list (with yc)

docker_container.nginx
docker_image.nginx
yandex_compute_instance.vm-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1